import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(home: Hwk9()));
}

class Hwk9 extends StatefulWidget {
  @override
  _Hwk9State createState() => _Hwk9State();
}

class _Hwk9State extends State<Hwk9> {
  late List<List<dynamic>> presidentsArray;

  @override
  void initState(){
    loadAsset();
    super.initState();
  }

  loadAsset() async{
    try
  }
    var rawdata = await rootBundle.loadString(
        'assets/us_presidents_partial.csv');

    //populate the list
    List<List<dynamic>> csvArray = CsvToListConverter(eol: '/n', fieldDeLimiter: ',').convert(rawdata);

    setState((){
      presidentsArray = csvArray;
    });
print(presidentsArray);

print('Array Size: ' + presidentsArray.length.toString());
print('Number of Fields: ' + presidentsArray[0].length.toString());
  }
on Exception catch(_){print('nothing');}

  @override
  Widget build(BuildContext context) {
    var presidentsArray;
    return Scaffold(
        appBar: AppBar(title: Text('US Presidents')),
        body: presidentsArray == null? Container() :
        Column(children: [
          Expanded(
        child: ListView.builder(
        itemCount: presidentsArray.length -1,
          itemBuilder: (context,index) {
            return ListTile(title: Text(presidentsArray[index + 1][0]),);
          }),
          ),
        ],));
  }
}