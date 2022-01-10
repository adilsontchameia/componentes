import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  List<int> _listaNumeros = [1, 2, 3, 4, 5];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _criarLista(),
    );
  }

  Widget _criarLista() {
    return ListView.builder(
      //quantidade de artigos na lista
      itemCount: _listaNumeros.length,
      //forma como vai se mostrar na tela
      itemBuilder: (BuildContext context, int index) {
        final imagem = _listaNumeros[index];

        return const FadeInImage(
          image: NetworkImage(
              'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6.jpg'),
          placeholder: AssetImage('assests/jar-loading.gif'),
        );
      },
    );
  }
}
