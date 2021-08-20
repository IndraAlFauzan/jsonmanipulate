import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:test2/constant.dart';
import 'package:test2/model/data_model.dart';
import 'package:test2/service/serv.dart';
import 'package:test2/ui/searchwidget.dart';

class AllDataPage extends StatefulWidget {
  const AllDataPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<AllDataPage> {
  List<DataModel> datamdl = [];
  String query = '';

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
      body: Column(
        children: [
          buildSearch(),
          Expanded(
            child: Padding(
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
                                  'Type : ' + datamdl[build].tags!.join(' , '),
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSearch() =>
      SearchWidget(text: query, onChanged: search, hintText: 'Search ');

  void search(String query) async {
    final search = await Serv.readJson(query);

    setState(() {
      query = query;
      datamdl = search;
    });
  }
}
