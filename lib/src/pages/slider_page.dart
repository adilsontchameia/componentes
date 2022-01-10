import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 100.0;
  bool _bloquearCheck = false;
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
            _criarCheckBox(),
            _criarSwitch(),
            Expanded(
              child: _criarImagem(),
            ),
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
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
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

  Widget _criarCheckBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (valor) {
    //       setState(
    //         () {
    //           _bloquearCheck = valor!;
    //         },
    //       );
    //     });
    return CheckboxListTile(
        value: _bloquearCheck,
        title: Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(
            () {
              _bloquearCheck = valor!;
            },
          );
        });
  }

  _criarSwitch() {
    return SwitchListTile(
        value: _bloquearCheck,
        title: Text('Bloquear Slider'),
        onChanged: (valor) {
          setState(
            () {
              _bloquearCheck = valor;
            },
          );
        });
  }
}
