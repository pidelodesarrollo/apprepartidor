import 'package:flutter/material.dart';

class ReportePage extends StatelessWidget {
  static final String routeName = 'reporte';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactanos'),
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
          SizedBox(height: 10.0),
          _cardTitulo(),
          SizedBox(height: 10.0),
          _cardNum1(),
          SizedBox(height: 10.0),
          _cardNum2(),
          SizedBox(height: 10.0),
          _cardPhone(),
        ],
      ),
    );
  }

  Widget _cardNum1() {
    final card = Container(
      height: 410.0,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'http://recursos.pideloyaa.com/img/imagenes/contacto/persona_feliz.jpg'),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 230.0,
            width: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Haz nos saber en que podemos mejorar',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold)),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
                'Si tienes alguna sugerencia o quieres levantar una queja, con gusto te atenderemos ',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold)),
          ),
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

  Widget _cardNum2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.mail_outline, color: Colors.black),
            title: Text('Por favor envianos un correo a:'),
            subtitle: Text('hola@pidaloyaaa.com'),
          )
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
            leading: Icon(Icons.lightbulb_outline, color: Colors.black),
            title: Text('Porque tu opinión es muy importante'),
          )
        ],
      ),
    );
  }

  Widget _cardPhone() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.phone, color: Colors.black),
            title: Text('o llamanos al 222 813 8680'),
            subtitle: Text(
                'nuestro equipo de atención a clientes con gusto te atendera.'),
          )
        ],
      ),
    );
  }
}
