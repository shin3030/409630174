import 'package:flutter/material.dart';

void main()=> runApp(MyApp());
var imagelist=[
  'assets/bird.PNG','assets/duck.PNG',
  'assets/lion.PNG','assets/wolf.PNG',];
var titleText=['','測出隱藏的自己',];
var contextlist=[
  '   你總是試圖掌控局面、掌控一切，但你並不是一個殘暴的暴君，而是責任感很強又細心的領導者',//鱷魚
  '   也許你不介意在這艱辛的世代裡隨波逐流，但這並不代表你沒有自己的意見，而是嘗試在與他人合作的過程中做出妥協，這也是為什麼你如此坦誠且善於交際',//鳥
  '   你的生活可能容易受情緒衝動所影響，你的情緒起伏很大，容易因為一時衝動而做出突然的決定',//鴨子
  '   你喜歡先考慮每個行動可能帶來的結果，邏輯、理性通常在你失活中占有一席之地，但這也並不一定意味著你是個冷漠和不敏感的人',//兔子
  '   你總是想要找到事情的根源，喜歡追根究柢，且不害怕面對最強烈的恐懼，說明你是個非常勇敢的人',//獅子
  '   在某些情況下也許你會顯得有些冷靜，旁人看你不太負責任。但其實你的頭腦比較簡單，卻具有豐富的創意，渴望能夠為這世界做些什麼，使其變得更好',//奇特的鳥
  '   這代表你分析這張圖的方式為由左到右，為典型且常規的看東西方式。這並非代表你是個墨守成規的人，而是你在思維方式上較邏輯，也擅長分析',//狗頭
  '   說明你看這張圖片為右向左，當你在解決問題時嘗試應用較創新的方法，你不喜歡照著傳統的思維方式',//狗尾

];
var ButtonText=[
  '兩隻鱷魚','一隻飛鳥',
  '一隻鴨子','一隻兔子',
  '一隻獅子','奇特的鳥',
  '小狗的頭','小狗尾巴',
];
var index=0;
var titlecounter=1;
var contextcounter=0;
var Buttoncounter1=0;
var Buttoncounter2=1;
final _messangerKey = GlobalKey<ScaffoldMessengerState>();
class _MyAppState extends State<MyApp>{
  @override

  Widget build(BuildContext context) {
    return
      MaterialApp(
          scaffoldMessengerKey: _messangerKey,
          home: Scaffold(
            appBar: AppBar(title: Text('圖像心理測驗'),backgroundColor: Colors.grey[800],),
            body:Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[

                  Container(
                    color: Colors.grey,
                    height: 200,width: 380,
                    alignment: Alignment.center,
                    child:titlecounter==1?
                    Text(titleText[titlecounter],style: TextStyle(fontSize: 50),):
                    Text(contextlist[contextcounter],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                  ),

                    ElevatedButton(
                      style:ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child:Ink.image(
                        height: 200,
                      fit: BoxFit.fill,
                        image: AssetImage(imagelist[index]),),
                    onPressed: () {
                      _messangerKey.currentState?.showSnackBar(SnackBar(
                        content: const Text('請憑直覺選出答案'),
                        action: SnackBarAction(
                          label: 'Close',
                          onPressed: () {},),));

                      }),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_left_rounded),
                        onPressed:(){
                          setState(() {
                            if(Buttoncounter1!=0){
                            Buttoncounter1=Buttoncounter1-2;
                            Buttoncounter2=Buttoncounter2-2;}
                            if(index>0){
                              index=index-1;}
                            titlecounter=1;
                          });

                        },),
                      IconButton(
                        iconSize: 60,
                        icon:const Icon(Icons.arrow_circle_right_rounded),
                        onPressed:(){
                          setState(() {
                            if(Buttoncounter1!=6){
                            Buttoncounter1=Buttoncounter1+2;
                            Buttoncounter2=Buttoncounter2+2;}
                            if(index<3){
                              index=index+1;}
                            titlecounter=1;
                          });

                        },),
                    ],

                  ),
                  const SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children:<Widget>[
                      ElevatedButton(
                        style: myButtonStyle,
                        child:Text(ButtonText[Buttoncounter1],style: TextStyle(fontSize: 30),),
                        onPressed:(){
                          setState(() {
                            titlecounter=0;
                            contextcounter=Buttoncounter1;
                          });
                        },),
                      ElevatedButton(
                        style: myButtonStyle,
                        child:Text(ButtonText[Buttoncounter2],style: TextStyle(fontSize: 30),),
                        onPressed:(){
                          setState(() {
                            titlecounter=0;
                            contextcounter=Buttoncounter2;
                          });
                        },)
                    ],
                  ),


                ],),),

            backgroundColor: Colors.grey,
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

final ButtonStyle myButtonStyle = ElevatedButton.styleFrom(
  primary: Colors.black,
  onPrimary: Colors.black,
  backgroundColor: Colors.yellow[600],
  minimumSize: Size(88, 36),
  elevation: 10,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),

  ),
);