import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appBarColor = Color(0xff8B9366);
    const iconColor = Color(0xff333333);
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'UNION',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  'Jakarta, Indonesia',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          /*3*/
          Icon(
            Icons.favorite,
            color: Colors.red[500],
          ),
          const Text('999'),
        ],
      ),
    );

    Color color = iconColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Union is where Jakarta’s residents go when they want quality bistro fare, well-made cocktails and the best cakes the city offers. Scattered throughout some of the city’s most dynamic areas, customers can always expect to see the brand’s signature interiors, yet should always look out for details unique to each location. The kitchen, led by Head Chef Adhika Maxi, turns out comfort food with a twist, while Pastry Chef Karen Carlotta creates the famous cakes, breads and pastries. The bar, which is ranked #39 in Asia’s 50 Best Bars 2019, serves classic cocktails and concoctions with local ingredients, developed by its award-winning Head Mixologist, Kiki Moka.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter Layout App',
      theme: ThemeData(appBarTheme: const AppBarTheme(color: appBarColor)),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('UNION'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/union.jpeg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
