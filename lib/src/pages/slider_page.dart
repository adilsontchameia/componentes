import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _criarSlide(),
            Expanded(child: _criarImagem()),
          ],
        ),
      ),
    );
  }

  Widget _criarSlide() {
    return Slider(
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      activeColor: Colors.indigoAccent,
      label: 'Tamanho da imagem',
      //divisions: 20,
      onChanged: (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _criarImagem() {
    return Image(
      image: NetworkImage(
          'https://www.sideshow.com/storage/product-images/903421/iron-man_marvel_silo.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }
}
