import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegação com Rotas',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/media': (context) => MediaScreen(),
        '/calculadora': (context) => CalculadoraScreen(),
        '/imc': (context) => ImcScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Tela Inicial'),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/media');
                },
                child: Text('Media'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/calculadora');
                },
                child: Text('Calculadora'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/imc');
                },
                child: Text('IMC'),
              ),
            ])));
  }
}

class MediaScreen extends StatefulWidget {
  @override
  _MediaScreenState createState() => _MediaScreenState();
}

class _MediaScreenState extends State<MediaScreen> {
  TextEditingController primeiroNumeroController = TextEditingController();
  TextEditingController segundoNumeroController = TextEditingController();
  TextEditingController terceiroNumeroController = TextEditingController();
  TextEditingController quartoNumeroController = TextEditingController();

  double resultado = 0.0;
  String result = '';
  bool estaReprovado = true;
  void somar() {
    double primeiroNumero =
        double.tryParse(primeiroNumeroController.text) ?? 0.0;
    double segundoNumero = double.tryParse(segundoNumeroController.text) ?? 0.0;
    double terceiroNumero =
        double.tryParse(terceiroNumeroController.text) ?? 0.0;
    double quartoNumero = double.tryParse(quartoNumeroController.text) ?? 0.0;

    setState(() {
      resultado =
          (primeiroNumero + segundoNumero + terceiroNumero + quartoNumero) / 4;
      if (resultado < 7) {
        result = "Reprovado";
        estaReprovado = true;
      } else {
        result = "Aprovado";
        estaReprovado = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('MEDIA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: primeiroNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: segundoNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: terceiroNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 3'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quartoNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 4'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: somar,
              child: Text('MEDIA'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 95, 13, 7)),
            ),
            SizedBox(height: 20),
            Text(
              '$result',
              style: TextStyle(
                color: estaReprovado ? Colors.red : Colors.green,
                fontSize: 24,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculadoraScreen extends StatefulWidget {
  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  TextEditingController primeiroNumeroController = TextEditingController();
  TextEditingController segundoNumeroController = TextEditingController();

  double resultado = 0.0;
  String result = '';

  void somar() {
    double primeiroNumero =
        double.tryParse(primeiroNumeroController.text) ?? 0.0;
    double segundoNumero = double.tryParse(segundoNumeroController.text) ?? 0.0;

    setState(() {
      resultado = primeiroNumero + segundoNumero;
    });
  }

  void subtrair() {
    double primeiroNumero =
        double.tryParse(primeiroNumeroController.text) ?? 0.0;
    double segundoNumero = double.tryParse(segundoNumeroController.text) ?? 0.0;

    setState(() {
      resultado = primeiroNumero - segundoNumero;
    });
  }

  void multiplicar() {
    double primeiroNumero =
        double.tryParse(primeiroNumeroController.text) ?? 1.1;
    double segundoNumero = double.tryParse(segundoNumeroController.text) ?? 1.1;

    setState(() {
      resultado = primeiroNumero * segundoNumero;
    });
  }

  void dividir() {
    double primeiroNumero =
        double.tryParse(primeiroNumeroController.text) ?? 0.0;
    double segundoNumero = double.tryParse(segundoNumeroController.text) ?? 0.0;

    setState(() {
      resultado = primeiroNumero / segundoNumero;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('CALCULADORA'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: primeiroNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 1'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: segundoNumeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Número 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: somar,
              child: Text('Somar'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: subtrair,
              child: Text('Subtrair'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: dividir,
              child: Text('Dividir'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: multiplicar,
              child: Text('Multiplicar'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 95, 13, 7)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}

class ImcScreen extends StatefulWidget {
  @override
  _ImcScreenState createState() => _ImcScreenState();
}

class _ImcScreenState extends State<ImcScreen> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  double resultado = 0.0;
  String result = '';

  void calcular() {
    double peso = double.tryParse(pesoController.text) ?? 0.0;
    double altura = double.tryParse(alturaController.text) ?? 0.0;

    setState(() {
      resultado = peso / (altura * altura);

      if (resultado < 16) {
        result = "Magreza grave";
      } else if (resultado < 17) {
        result = "Magreza moderada";
      } else if (resultado < 18.5) {
        result = "Magreza leve";
      } else if (resultado < 25) {
        result = "Saudável";
      } else if (resultado < 30) {
        result = "Sobrepeso";
      } else if (resultado < 35) {
        result = "Obsidade - Grau I";
      } else if (resultado < 40) {
        result = "Obsidade - Grau II / Severa";
      } else {
        result = "Obsidade - Grau III / Morbida";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      appBar: AppBar(
        title: Text('IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Peso'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Altura'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcular,
              child: Text('calcular'),
            ),
            SizedBox(height: 20),
            Text(
              'Resultado: $resultado',
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 3, 3, 3)),
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(
                  fontSize: 24, color: Color.fromARGB(255, 3, 3, 3)),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Text('Voltar'),
            ),
          ],
        ),
      ),
    );
  }
}
