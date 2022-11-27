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
        return item(_data?[index],index);
      },itemCount:  _data == null ? 1:10,),
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  // https://api.zhihu.com/topstory/hot-list
  Widget item(Map item,int idx) {
    return Container(
      // color: Colors.amber,
      padding: EdgeInsets.only(left: 16,right: 16,top: 16),
      child: Column(
        children: [
           Row(
            children: [
              Container(
                width: 30,
                decoration: const BoxDecoration(
                  gradient:LinearGradient(
                    // begin: Alignment.topLeft, //右上
                    // end: Alignment.bottomRight, //左下
                    stops: [0.0, 1.0],
                    colors: [Colors.orange,Colors.white],
                  )
                ),
                // color: Colors.orange,
                child: Center(
                  child: Text(
                    "${idx+9}",
                    style:const TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                    ),

                  ),
                ),
              ),
              const SizedBox(width: 5,),
              // 标题
              Expanded(child: Text(item["target"]["title"] ?? "",
                overflow:TextOverflow.ellipsis,
                maxLines: 1,style: const TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w600,

              ),),

              ),
            ],
          ),
         const SizedBox(height: 8,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  // color: Colors.blue,
                  child: Text(item["target"]["title"] ?? "",
                    maxLines: 3,

                    style: TextStyle(
                      height: 1.5,
                    ),

                  ),
                ),
              ),
              const  SizedBox(width: 10,),
              // 右侧图片
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(item["children"][0]["thumbnail"])
                  )
                ),
                // color: Colors.orange,
                height: 60,
                width: 90,
              ),
            ],
          )
        ],
      ),
    );
  }


}
