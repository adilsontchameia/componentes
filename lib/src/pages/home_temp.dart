import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opcoes = ['Um', 'Dois', 'Tres', 'Quatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _criarItens(),
      ),
    );
  }

//Metodo que regressa uma lista
  List<Widget> _criarItens() {
//O que se vai retornar
    List<Widget> lista = [];

    for (String opt in opcoes) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      //Usar operador de cascada
      //Referenciar a lista
      lista
        ..add(tempWidget)
        ..add(Divider());
    }
    return lista;
  }
}
