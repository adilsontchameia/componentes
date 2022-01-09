//Usar servicos - Servico de leitura json
import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opcoes = [];

  _MenuProvider() {
    //carregarData();
  }

  //Algo que se resolva no futuro, quando o processo todo termina
  //Segundos dps vai retornar o que esta abaixo
  Future<List<dynamic>> carregarData() async {
    final resp = await rootBundle.loadString('data/menu_opts.json');
    Map dataMap = json.decode(resp);
    //print(dataMap['rutas']);
    opcoes = dataMap['rutas'];

    return opcoes;
  }
}

final menuProvider = new _MenuProvider();
