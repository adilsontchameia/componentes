import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  //Controlador da lista
  ScrollController _scrollController = new ScrollController();
  List<int> _listaNumeros = [];
  int _ultimoItem = 0;

  //que vai iniciar no inicio do app
  @override
  void initState() {
    super.initState();

    _aumentar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _aumentar10();
      }
    });
  }

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
      controller: _scrollController,
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

  void _aumentar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }
}
