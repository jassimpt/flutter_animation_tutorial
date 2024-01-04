import 'package:animation_tutorial/constants/datas.dart';
import 'package:animation_tutorial/views/detailsscreen.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final datas = data[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(data: datas),
                    ));
              },
              child: ListTile(
                leading: Hero(
                  tag: datas.id!,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(datas.image!),
                  ),
                ),
                title: Text(datas.placename!),
                subtitle: Text(datas.location!),
              ),
            );
          },
        ),
      ),
    );
  }
}
