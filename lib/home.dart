import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency converter"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "🇧🇷",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.swap_horiz,
                    color: Colors.black45,
                  ),
                  iconSize: 40,
                  onPressed: () {
                    // Inverter a conversão
                  },
                ),
                Text(
                  "🇺🇸",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "VALOR",
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5),
                  child: Text("R\$"),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            Icon(
              Icons.swap_vert,
              color: Colors.black12,
              size: 50,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "VALOR CONVERTIDO",
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 5),
                  child: Text("\$"),
                ),
              ),
              enabled: false,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
