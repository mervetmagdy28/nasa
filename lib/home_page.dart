import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nasa/constants.dart';
import 'package:nasa/model.dart';
import 'package:nasa/widgets/card_widget.dart';

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Model> data = [];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: data.isEmpty ?const Center(child: CircularProgressIndicator()):CustomScrollView(
            slivers:[
              SliverAppBar(
                pinned: true,
                floating: true,
                expandedHeight: 160,
                backgroundColor: Colors.white,collapsedHeight: 80,
                leading: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black87,)),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: const EdgeInsets.only(left: 10,bottom: 10),
                  title: const Text('APOD', style: TextStyle(color: Colors.black),),
                  collapseMode: CollapseMode.pin,
                  background: Image(image: AssetImage(nasaImage)),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return CustomCard(data: data[index]);
                   },childCount: data.length),
              )
            ]
        ),
      ),
    );
  }

  getData() async {
    var response = await http.get(Uri.parse(
        httpRequest));
    var dataa=jsonDecode(response.body);
    setState(() {
      for(var item in dataa){
        Model model=Model();
       model.img=item["url"];
       model.title=item["title"];
       model.date=item["date"];
       model.explanation=item["explanation"];
        if (model.img!.contains(".jpg")) {
          data.add(model);
        }
      }
    });
  }
}
