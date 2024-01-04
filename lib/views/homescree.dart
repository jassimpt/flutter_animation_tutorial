import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double width = 100;
  var color = Colors.red;
  bool clicked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                decoration: BoxDecoration(color: color),
                curve: Curves.bounceInOut,
                width: width,
                height: width,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  clicked = !clicked;
                  setState(() {
                    !clicked ? width = 200 : width = 100;
                    !clicked ? color = Colors.amber : color = Colors.red;
                  });
                },
                child: const Text('Click'))
          ],
        ),
      ),
    );
  }
}
