import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [_cardTipo1(), SizedBox(height: 30.0), _cardTipo2()],
      ),
    );
  }

  Widget _cardTipo1() {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.photo_album,
              color: Colors.blue,
            ),
            title: Text('Titulo desse Card'),
            subtitle: Text(
                'Ca vai o exemplo de um texto longo do card para ver como ele fica realmente.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {},
                child: Text('Ok'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Card(
      child: Column(
        children: [
          FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: NetworkImage(
                'https://i.natgeofe.com/n/2a832501-483e-422f-985c-0e93757b7d84/6.jpg'),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Imagem'),
          )
        ],
      ),
    );
  }
}
