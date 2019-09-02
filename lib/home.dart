import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class Home extends StatefulWidget {
  // Cotação atual do Dólar
  final _valorDolar = 4.20;

  // Dados da moeda Real
  final _real = {
    'flag': "🇧🇷",
    'simbolo': 'R\$',
    'color': Colors.green[100],
  };

  // Dados da moeda Dólar
  final _dolar = {
    'flag': "🇺🇸",
    'simbolo': '\$',
    'color': Colors.blue[100],
  };

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<String, dynamic> moedaBase = Map();
  Map<String, dynamic> moedaConversao = Map();
  MoneyMaskedTextController inputController;
  MoneyMaskedTextController resultadoController;
  Color _backgroundColor;

  @override
  void initState() {
    super.initState();

    inputController = MoneyMaskedTextController(
      decimalSeparator: ",",
      thousandSeparator: ".",
    );
    resultadoController = MoneyMaskedTextController(
      decimalSeparator: ",",
      thousandSeparator: ".",
      initialValue: 0.0,
    );

    // Estado inicial do app
    moedaBase = widget._real;
    moedaConversao = widget._dolar;
    _backgroundColor = widget._real['color'];
  }

  /// Altera a conversão Real x Dolar => Dolar x Real
  void _alteraMoedaBase() {
    if (moedaBase == widget._real) {
      setState(() {
        moedaBase = widget._dolar;
        moedaConversao = widget._real;
        _backgroundColor = moedaBase['color'];
      });
    } else {
      setState(() {
        moedaBase = widget._real;
        moedaConversao = widget._dolar;
        _backgroundColor = moedaBase['color'];
      });
    }
  }

  /// Realiza conversão das moedas
  void _converter() {
    double valorBase = inputController.numberValue;

    double valorConvertido = 0.0;

    if (moedaBase == widget._real) {
      valorConvertido = valorBase / widget._valorDolar;
    } else {
      valorConvertido = valorBase * widget._valorDolar;
    }

    resultadoController.updateValue(valorConvertido);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency converter"),
      ),
      backgroundColor: _backgroundColor,
      body: Container(
        padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 80.0),
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
                    fontSize: 50,
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
                    _converter();
                  },
                ),
                Text(
                  moedaConversao['flag'],
                  style: TextStyle(
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "VALOR",
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Text(moedaBase['simbolo']),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: inputController,
              onChanged: (vl) {
                _converter();
              },
            ),
            Icon(
              Icons.swap_vert,
              color: Colors.black12,
              size: 50,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "VALOR CONVERTIDO",
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 10.0),
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
        child: Icon(Icons.check),
      ),
    );
  }
}
