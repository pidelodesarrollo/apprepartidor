import 'package:flutter/material.dart';

import 'package:negocioapp/src/models/cliente_model.dart';

class CuentaPage extends StatefulWidget {
  static final String routeName = 'cuenta';

  @override
  _CuentaPageState createState() => _CuentaPageState();
}

class _CuentaPageState extends State<CuentaPage> {
  final formKey = GlobalKey<FormState>();

  ClienteModel cliente = new ClienteModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi cuenta'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Configuraciones',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  _crearNombre(),
                  _crearCorreo(),
                  SizedBox(
                    height: 20,
                  ),
                  _metodoPago(),
                  SizedBox(
                    height: 40,
                  ),
                  _crearBoton(),
                ],
              )),
        ),
      ),

      /*  
      ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Configuraciones',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          _correoCliente(bloc),
        ],
      ), */
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          }),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: cliente.nombre,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Nombre',
      ),
      onSaved: (value) => cliente.nombre = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del cliente';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearCorreo() {
    return TextFormField(
      initialValue: cliente.correo,
      //textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Correo Electrónico',
      ),
      onSaved: (value) => cliente.correo = value,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el correo del cliente';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.lightGreen,
      textColor: Colors.white,
      label: Text('Actualizar'),
      icon: Icon(Icons.update),
      onPressed: _submit,
    );
  }

  Widget _metodoPago() {
    return SwitchListTile(
        value: cliente.metodopago,
        title: Text('Pago Electronico'),
        activeColor: Colors.lightGreen,
        onChanged: (value) => setState(() {
              cliente.metodopago = value;
            }));
  }

  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
  }
}
