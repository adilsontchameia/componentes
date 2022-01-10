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

        return Image(
          image: NetworkImage('https://picsum.photos/500/300/?image=$imagem'),
        );
        // return FadeInImage(
        //   image: NetworkImage('https://picsum.photos/500/300/?image=$imagem'),
        //   placeholder: const AssetImage('assests/jar-loading.gif'),
        // );
      },
    );
  }
}
