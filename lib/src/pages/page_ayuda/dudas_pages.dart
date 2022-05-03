import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DudasPage extends StatelessWidget {
  static final String routeName = 'dudas';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas Frecuentes'),
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
          _cardTitulo(),
          SizedBox(height: 20.0),
          _cardNum1(),
          SizedBox(height: 10.0),
          _cardTip1(),
          SizedBox(height: 10.0),
          _cardTip2(),
          SizedBox(height: 10.0),
          _cardTip3(),
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
            leading: Icon(Icons.format_quote, color: Colors.black),
            title: Text('Haz llegado al lugar indicado'),
            subtitle: Text(
                'Aquí estan una serie de tips para hacer más facil, que uses nuestra app'),
          )
        ],
      ),
    );
  }

  Widget _cardNum1() {
    final card = Container(
      height: 400.0,
      child: Column(
        children: [
          FadeInImage(
            image: NetworkImage(
                'http://recursos.pideloyaa.com/img/imagenes/ofrecemos/chicos.png'),
            placeholder: AssetImage('assets/img/loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Te ayudamos si no sabes por donde empezar',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
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

  Widget _cardTip1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.send, color: Colors.black),
            title: Text('¿Que puedo pedir por Pidelo Yaa?'),
            subtitle: Text(
                'Comida , Abarrotes, medicamentos y hasta un servicio de un profesional'),
          )
        ],
      ),
    );
  }

  Widget _cardTip2() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.monetization_on, color: Colors.black),
            title: Text('¿Como puedo pagar mis pedidos?'),
            subtitle: Text(
                'Por el momento solo aceptamos pagos electrónicos con la tarjeta bancaria de tu preferencia.'),
          )
        ],
      ),
    );
  }

  Widget _cardTip3() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(FontAwesomeIcons.info, color: Colors.black),
            title: Text('¿Quieres ser parte de Pídelo yaa?'),
            subtitle: Column(
              children: [
                Text(
                    'Si deseas información de como ser socio o Pide-repartidor , presiona el link y visita nuestra pagina:'),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL();
                  },
                  child: Text(
                    'www.pideloyaa.com',
                    style: TextStyle(color: Colors.lightGreen, fontSize: 15.0),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _launchURL() async {
    const url = 'http://www.pideloyaa.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
