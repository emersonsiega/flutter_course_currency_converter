import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  // Cotação atual do Dólar
  final _valorDolar = 4.20;

  // Dados da moeda Real
  final _real = {
    'flag': "🇧🇷",
    'simbolo': 'R\$',
  };

  // Dados da moeda Dólar
  final _dolar = {
    'flag': "🇺🇸",
    'simbolo': '\$',
  };

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> moedaBase = Map();
  Map<String, dynamic> moedaConversao = Map();
  TextEditingController inputController;
  TextEditingController resultadoController;

  @override
  void initState() {
    super.initState();

    inputController = TextEditingController();
    resultadoController = TextEditingController(text: "0.00");

    // Estado inicial do app
    moedaBase = widget._real;
    moedaConversao = widget._dolar;
  }

  /// Altera a conversão Real x Dolar => Dolar x Real
  void _alteraMoedaBase() {
    if (moedaBase == widget._real) {
      setState(() {
        moedaBase = widget._dolar;
        moedaConversao = widget._real;
      });
    } else {
      setState(() {
        moedaBase = widget._real;
        moedaConversao = widget._dolar;
      });
    }
  }

  /// Realiza conversão das moedas
  void _converter() {
    double valorBase = double.parse(inputController.text);
    double valorConvertido = valorBase * widget._valorDolar;
    resultadoController.text = valorConvertido.toStringAsFixed(2);
  }

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
                  moedaBase['flag'],
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
                    _alteraMoedaBase();
                  },
                ),
                Text(
                  moedaConversao['flag'],
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
                  child: Text(moedaBase['simbolo']),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: inputController,
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
                  child: Text(moedaConversao['simbolo']),
                ),
              ),
              enabled: false,
              controller: resultadoController,
              textInputAction: TextInputAction.done,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _converter();
        },
        child: Icon(Icons.autorenew),
      ),
    );
  }
}
