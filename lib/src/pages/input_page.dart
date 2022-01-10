import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nome = '';
  String _email = '';
  String _data = '';
  String _opcaoSelecionada = 'Voar';
  List<String> _poderes = ['Voar', 'Raio X', 'Super Forca', 'Adilson'];
  TextEditingController _inputData = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inputs'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: [
            _criarInput(),
            Divider(),
            _criarEmail(),
            Divider(),
            _criarPassword(),
            Divider(),
            _criarData(context),
            Divider(),
            _criarDropDown(),
            Divider(),
            _criarPessoa(),
          ],
        ));
  }

  _criarInput() {
    return TextField(
      //autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        counterText: 'Letras ${_nome.length}',
        hintText: 'Insira um texto',
        labelText: 'Escreva Seu Nome',
        helperText: 'Apenas o Primeiro Nome',
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.add_a_photo),
      ),
      //Pegando texto escrito
      onChanged: (valor) {
        setState(() {
          _nome = valor;
          print(_nome);
        });
      },
    );
  }

  Widget _criarPessoa() {
    return ListTile(
      title: Text('Nome es: $_nome'),
      subtitle: Text('Email: $_email'),
    );
  }

  _criarEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        helperText: 'Correio Eletronico',
        suffixIcon: Icon(Icons.alternate_email),
        icon: Icon(Icons.email),
      ),
      //Pegando texto escrito
      onChanged: (valor) {
        setState(() {
          _nome = valor;
          print(_nome);
        });
      },
    );
  }

  _criarPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: Icon(Icons.lock_open),
        icon: Icon(Icons.lock),
      ),
    );
  }

  _criarData(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      //controlador
      controller: _inputData,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Data de Nascimento',
        labelText: 'Data de Nascimento',
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        //tirar o foco do campo para evitar alteracao
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  //Metodo do datePicker
  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        //Restringir o selector
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2023),
        //Mudar o idioma
        locale: Locale('pt'));
    if (picked != null) {
      setState(() {
        _data = picked.toString();
        //Inserindo a data no textField
        _inputData.text = _data;
      });
    }
  }

  //Lista dos elementos
  List<DropdownMenuItem<String>> getOpcoesDropdown() {
    List<DropdownMenuItem<String>> lista = [];
    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    }
    return lista;
  }

  _criarDropDown() {
    return DropdownButton(
      //valor atual da opcao selecionada
      value: _opcaoSelecionada,
      items: getOpcoesDropdown(),
      onChanged: (opt) {
        setState(() {
          _opcaoSelecionada = opt.toString();
        });
      },
    );
  }
}
