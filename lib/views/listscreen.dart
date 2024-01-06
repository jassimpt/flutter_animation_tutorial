import 'package:animation_tutorial/constants/datas.dart';
import 'package:animation_tutorial/views/detailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "Places to visit",
                style: GoogleFonts.poppins(
                    fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
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
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 20),
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black.withOpacity(0.2),
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(3),
                              child: Hero(
                                tag: datas.id!,
                                child: Container(
                                  // height: size.height * 0.8,
                                  width: size.width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                          image: AssetImage(datas.image!),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datas.placename!,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  datas.location!,
                                  style: GoogleFonts.poppins(
                                      color: Colors.black.withOpacity(0.6)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
