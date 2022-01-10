import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
          child: RaisedButton(
        onPressed: () => _mostrarAlert(context),
        child: Text('Mostrar Alerta'),
        textColor: Colors.blue,
        shape: StadiumBorder(),
      )),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}

void _mostrarAlert(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          title: Text('Titulo'),
          content: Column(
            //Se adapte ao conteudo
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Este conteudo e da caixa da alerta.'),
              FlutterLogo(
                size: 100.0,
              ),
            ],
          ),
          actions: [
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Ok'),
            )
          ],
        );
      });
}
