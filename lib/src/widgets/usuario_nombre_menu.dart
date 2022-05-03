import 'package:negocioapp/src/models/infocliente_model.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UsuarioNombreMenu extends StatelessWidget {
  final List<InfoCliente> infocliente;

  const UsuarioNombreMenu({@required this.infocliente});

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
            Image.asset(
              'assets/icons/avatar.png',
              width: 70.0,
            ),
            //Icon(FontAwesomeIcons.userAlt),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Container(
                child: Text(
                  'Hola ${this.infocliente[index].razonsocial}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
