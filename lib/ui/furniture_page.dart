import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test2/constant.dart';
import 'package:test2/model/data_model.dart';
import 'package:test2/service/serv.dart';

class Furniture extends StatefulWidget {
  const Furniture({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Furniture> {
  List<DataModel> datamdl = [];
  String query = 'electronic';

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  Future getAllData() async {
    final allData = await Serv.readJson(query);

    setState(() {
      datamdl = allData;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: datamdl.length,
                itemBuilder: (context, build) {
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      color: Colors.white,
                      elevation: 10,
                      margin: const EdgeInsets.all(12),
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Inventory ID : ' +
                                      datamdl[build].inventoryId.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Name : ' + datamdl[build].name.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Type : ' + datamdl[build].type.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Type : ' +
                                      datamdl[build].tags!.join().toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Purchase at : ' +
                                      datamdl[build].purchasedAt.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'Placement : ' '\n' 'Room Id : ' +
                                      datamdl[build]
                                          .placement!
                                          .roomId
                                          .toString() +
                                      '\n' +
                                      'Name : ' +
                                      datamdl[build].placement!.name.toString(),
                                  style: const TextStyle(fontSize: 20)),
                            ),
                          ],
                        ),
                      ));
                })));
  }
}
