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
        //children: _criarItens(),
        children: _criarItensCurto(),
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

  List<Widget> _criarItensCurto() {
    return opcoes.map((item) {
      //Tem que regressar um widget
      return Column(
        children: [
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('Subtitulo'),
            leading: Icon(Icons.star_outline),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider(),
        ],
      );
    }).toList();
  }
}
