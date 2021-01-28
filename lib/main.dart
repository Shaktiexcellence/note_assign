import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(title: 'Notes'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
AnimationController _controller;
Animation<Offset> offsetAnimation;

@override
void initState(){
  _controller = AnimationController(duration:Duration(seconds:2),vsync: this,)..repeat(reverse:true);
  offsetAnimation = Tween<Offset>(begin: Offset.zero,end:Offset(1.5,0) ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticIn));
 
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
                title: Text(widget.title)
      ),
      body: SlideTransition(position: offsetAnimation,
      child: Column(
        children: [
          SizedBox(height: 100),
          SingleChildScrollView(scrollDirection: Axis.horizontal,
                      child: Row(children:<Widget>[
              Container( height: 50,width: 100, decoration: BoxDecoration(
                color: Colors.redAccent,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              bottomLeft: Radius.circular(10.0))
              ),child: Icon(Icons.push_pin,color: Colors.white)
              ),
              Container(  margin: EdgeInsets.only(left:8,right:8),decoration: BoxDecoration(
                color: Colors.white10,
              border: Border.all(
                color: Colors.black
            ),
              borderRadius: BorderRadius.all(Radius.circular(10))
            ) , height: 50, child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(padding: EdgeInsets.only(left:8), child: Text("Sample ",style: TextStyle(color:Colors.white),)),
                  Container(margin: EdgeInsets.symmetric(horizontal:8), child: Text("11:13 AM No Additional text",style: TextStyle(color:Colors.white30),))
                ],
              )),
              Container(height: 50,width: 100, color: Colors.blueAccent, child: Icon(Icons.person_add,color: Colors.white)
              ),
              Container(height: 50,width: 100, color: Colors.indigoAccent, child: Icon(Icons.folder_open,color: Colors.white)
              ),
              Container(decoration: BoxDecoration(
                color: Colors.redAccent,
              borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0))
              ),
               height: 50,width: 100,  child: Icon(Icons.delete_outline,color: Colors.white)
              ),
            ] ),
          ),
        ],
      ),)
    );
  }
}
