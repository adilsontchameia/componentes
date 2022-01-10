import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late String _nome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [_criarInput()],
        ));
  }

  _criarInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterText: 'Letras',
        hintText: 'Insira um texto',
        labelText: 'Escreva Seu Nome',
        helperText: 'Apenas o Primeiro Nome',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.add_a_photo),
      ),
      //Pegando texto escrito
      onChanged: (valor) {
        _nome = valor;
        print(_nome);
      },
    );
  }
}
