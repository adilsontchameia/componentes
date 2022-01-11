import 'dart:async';

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
  //teste do fetch data
  bool _isLoading = false;

  //que vai iniciar no inicio do app
  @override
  void initState() {
    super.initState();

    _aumentar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_aumentar10();
        fetchData();
      }
    });
  }

  //Quando a pagina e desfeita
  //prevenir fuga de memoria
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body:
          //Stack coloca um em cima de outro
          Stack(
        children: [
          _criarLista(),
          _criarLoading(),
        ],
      ),
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

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    //Duracao
    final duration = Duration(seconds: 4);
    return Timer(duration, respostaHTTP);
  }

  void respostaHTTP() {
    _isLoading = false;
    _aumentar10();
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
  }

  Widget _criarLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
