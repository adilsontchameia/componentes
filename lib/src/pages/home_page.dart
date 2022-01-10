import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icone_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opcoes);
    return FutureBuilder(
      //o que vamos esperar
      future: menuProvider.carregarData(),
      initialData: [],
      //algo para mostrar na tela
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItens(snapshot.data!, context),
        );
      },
    );
  }

  List<Widget> _listaItens(List<dynamic> data, BuildContext context) {
    final List<Widget> opcoes = [];
    for (var opt in data) {
      final widgetTemp = ListTile(
        title: Text(opt['texto']),
        leading: getIcon(opt['icon']),
        trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue),
        onTap: () {
          Navigator.pushNamed(context, opt['ruta']);
          /*final route = MaterialPageRoute(builder: (context) => AlertPage());
          Navigator.push(context, route);
          */
        },
      );
      opcoes
        ..add(widgetTemp)
        ..add(Divider());
    }
    return opcoes;
  }
}
