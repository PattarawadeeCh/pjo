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
          child: Center(
            child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Product')
                  .doc(widget.docId)
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
        ),),
    );
  }
}
