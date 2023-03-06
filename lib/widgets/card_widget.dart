import 'package:flutter/material.dart';

import '../model.dart';

class CustomCard extends StatelessWidget {
   const CustomCard({Key? key, required this.data}) : super(key: key);
  final Model data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          boxShadow: const [
            BoxShadow(
                offset: Offset(5, 5),
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 10),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    image: ResizeImage(NetworkImage("${data.img}",), width: 340, height: 249,),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: SizedBox(width: MediaQuery.of(context).size.width*.8,
                      child: Text("${data.title}", style: const TextStyle(color: Colors.white,fontSize: 35),)),
                ),
                Positioned(
                  left: 20,
                  top: 100,
                  child: SizedBox(width: MediaQuery.of(context).size.width*.8,
                      height: MediaQuery.of(context).size.height*.11,
                      child: Text("${data.explanation}", style: const TextStyle(color: Colors.white,fontSize: 10),)),
                ),
                Positioned(
                    left: 20,
                    bottom: 30,
                    child: Text("Date of Event: ${data.date!.substring(8,10)}/${data.date!.substring(5,7)}/${data.date!.substring(0,4)}",style: const TextStyle(color: Colors.white,fontSize: 15), ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
