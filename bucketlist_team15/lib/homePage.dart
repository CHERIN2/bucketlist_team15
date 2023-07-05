import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name});

  final String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                "${widget.name}님,\n오늘하루도 화이팅 하세요",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: IconButton(
                        icon: Icon(CupertinoIcons.pin),
                        onPressed: () {},
                      ),
                      title: Text(
                        "text",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '버킷리스트 추가하기',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
