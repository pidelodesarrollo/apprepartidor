import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OfrecePage extends StatelessWidget {
  static final String routeName = 'ofrece';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Porque somos diferentes?'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.home),
          backgroundColor: Colors.lightGreen,
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          }),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          SizedBox(height: 20.0),
          _cardTitulo(),
          SizedBox(height: 25.0),
          _cardNum1(),
        ],
      ),
    );
  }

  Widget _cardTitulo() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: FaIcon(FontAwesomeIcons.bicycle, color: Colors.black),
            title: Text('Servicio De Entrega A Domicilio '),
            subtitle: Text(
                'La mejor plataforma de entrega de comida, abarrotes y medicinas'),
          )
        ],
      ),
    );
  }

  Widget _cardNum1() {
    final card = Container(
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'http://recursos.pideloyaa.com/img/imagenes/ofrecemos/hambugesa.jpg'),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Mucho bueno sabor'),
          )
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 2.0,
                offset: Offset(2.0, 10.0))
          ]
          //color: Colors.red
          ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}
