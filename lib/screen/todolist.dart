import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/screen/calculator.dart';

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

  String id = '1';

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Color(0xffecf0f1),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('todolist')
                      .doc(id)
                      .snapshots(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return CircularProgressIndicator();
                        break;
                      default:
                        return viewProduct(snapshot);
                    }
                  },
                ),
              ),
              RaisedButton(
                child: Text('Calculator'),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CalculatorPage(title: 'Calculator')),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget viewProduct(AsyncSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data.data();
    print(data['data']);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 60, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Name : ',
                      style: TextStyle(fontSize: 18, color: Colors.pink[500])),
                  Text(data['name'], style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text('Nickname : ',
                      style: TextStyle(fontSize: 18, color: Colors.pink[500])),
                  Text(data['nickname'], style: TextStyle(fontSize: 16)),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
