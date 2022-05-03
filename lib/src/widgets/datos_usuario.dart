import 'package:negocioapp/src/models/datoscliente_model.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatosUsuario extends StatelessWidget {
  final List<DatoCliente> infocliente;

  const DatosUsuario({@required this.infocliente});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.infocliente.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          children: <Widget>[
            SizedBox(
              height: 120,
            ),
            /* Image.asset(
              'assets/icons/avatar.png',
              width: 70.0,
            ), */
            //Icon(FontAwesomeIcons.userAlt),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(
                      'Nombre: ${this.infocliente[index].nombre} ${this.infocliente[index].apePat} ${this.infocliente[index].apeMat}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ubicación: ${this.infocliente[index].ubicacion}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Número Interior : ${this.infocliente[index].numero}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Entre las calles de ${this.infocliente[index].entrecalles} ',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
