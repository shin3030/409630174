import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
var imagelist=[
  'assets/0.png','assets/1.png',
  'assets/2.png','assets/3.png',
];
var index=0;

final _messangerKey = GlobalKey<ScaffoldMessengerState>();
class _MyAppState extends State<MyApp>{
  @override

  Widget build(BuildContext context) {
    return
      MaterialApp(
          scaffoldMessengerKey: _messangerKey,
          home: Scaffold(

            appBar: AppBar(title: Text('image test'),),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(imagelist[index]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_left_rounded),
                        onPressed:(){
                          setState(() {
                            if(index>0){
                              index=index-1;}
                          });
                          _messangerKey.currentState?.showSnackBar(SnackBar(
                            content: const Text('Test'),
                            action: SnackBarAction(
                              label: 'Cancel',
                              onPressed: () {
                              },
                            ),

                          ));
                        },),
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_right_rounded),
                        onPressed:(){
                          setState(() {
                            if(index<3){
                              index=index+1;}
                          });
                          _messangerKey.currentState?.showSnackBar(SnackBar(
                            content: const Text('Test'),
                            action: SnackBarAction(
                              label: 'Cancel',
                              onPressed: () {
                              },
                            ),

                          ));
                        },),
                    ],

                  )


                ],),),
          )
      );

  }
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}