import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DotoListPage extends StatefulWidget {
  const DotoListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<DotoListPage> createState() => _DotoListPageState();
}

class _DotoListPageState extends State<DotoListPage> {
  void initState() {
    super.initState();
  }
  final id = TextEditingController();
  final name = TextEditingController();
  final nickname = TextEditingController();

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[100],
        title: Text('TodoAdd'),
      ),
      // backgroundColor: Colors.green[50],
      body: Container(
        constraints: BoxConstraints.expand(),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 50, top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              child: Text('Insert data',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.pink[500])),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        // width: 300,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('ID : ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.pink[500])),
                                TextField(
                                  controller: id,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'ID'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        // width: 300,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Name : ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.pink[500])),
                                TextField(
                                  controller: name,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Name'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        // width: 300,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Nickname : ',
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.pink[500])),
                                TextField(
                                  controller: nickname,
                                  decoration: const InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Nickname'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      RaisedButton(
                        child: Text('บันทึกข้อมูล'),
                        onPressed: () {
                          addUserInfo();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DotoListPage(title: 'Todolist')),
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
Future<void> addUserInfo() async {
    List allergicList = [];
    String str = "";
    for (var d in allergicList) {
      if (d == allergicList.last)
        str += d;
      else
        str += d + ",";
    }

    await FirebaseFirestore.instance.collection('todolist').doc(id).set({
      'id': id,
      'name': name,
      'nickname': nickname,
    });
  }
  
}
