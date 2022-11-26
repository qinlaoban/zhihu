import 'package:flutter/material.dart';
import 'ok_http.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '热榜',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '热榜'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<dynamic>? _data ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
       OkHttp.getHttp("https://api.zhihu.com/topstory/hot-list").then((value) {
         print("runtimeType: ${value.runtimeType}");

         setState(() {
           _data = value["data"];
         });
       }).onError((error, stackTrace) {
         print("error>>>:${error}");
       });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView.builder(itemBuilder: (context,index){
        return item();
      },itemCount:  _data == null ? 1:10,),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // https://api.zhihu.com/topstory/hot-list
  Widget item() {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                color: Colors.orange,
                padding: EdgeInsets.only(left: 5,right: 5),
                child: Text(
                  "01",
                  style: TextStyle(
                    color: Colors.red
                  ),

                ),
              ),
              SizedBox(width: 5,),
              Text("2172w热舞")
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: Text("中国国家男子足男子足嫌严重违男子足嫌严重违男子足嫌严重违法，正接受,家男子足嫌严嫌严重违法，正接受,家男子足嫌严重违法家男子足嫌严重违法",
                    maxLines: 3,

                  ),
                ),
              ),
              SizedBox(width: 10,),
              Container(
                color: Colors.orange,
                height: 60,
                width: 100,
              ),
            ],
          )
        ],
      ),
    );
  }


}
