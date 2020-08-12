import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChallengeListPage(),
    );
  }
}

class ChallengeListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'UI Challenges',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ChallengeList(),
    );
  }
}

class ChallengeList extends StatelessWidget {
  final List<Challenge> challenges = [
    Challenge(
        imagePath: 'assets/flat_design_inspiration/image_bridge.jpg',
        name: 'Flat Design Inspiration'),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: List.generate(
          challenges.length,
          (index) => ChallengeItem(
                imagePath: challenges[index].imagePath,
                name: challenges[index].name,
              )),
    );
  }
}

class ChallengeItem extends StatelessWidget {
  final String name;
  final String imagePath;

  const ChallengeItem({Key key, this.name, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePath,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(color: Color(0x55000000)),
        Column(

          children: [
            Text('안녕하세요'),
          ],
        )
      ],
    );
  }
}

class Challenge {
  final String imagePath;
  final String name;

  Challenge({this.imagePath, this.name});
}
