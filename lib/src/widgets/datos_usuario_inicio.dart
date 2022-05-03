//import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:negocioapp/src/models/infocliente_model.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/models/negociospromos_model.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';
//import 'package:negocioapp/src/providers/categorias_provider.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DatosUsuarioInicio extends StatelessWidget {
  final List<Negocio> infocliente;

  const DatosUsuarioInicio({@required this.infocliente});

  @override
  Widget build(BuildContext context) {
    /*  final categoryService =
        Provider.of<CategoryService>(context, listen: false); */
    return ListView.builder(
      itemCount: this.infocliente.length,
      itemBuilder: (BuildContext context, int index) {
        if (this.infocliente[index].horario.toString() == 'En servicio') {
          return SafeArea(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  RaisedButton.icon(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      label: Text(
                        '    Fuera de horario   ',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.lightBlueAccent,
                      icon: Icon(
                        FontAwesomeIcons.businessTime,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        final usuario = new UsuarioProvider();

                        usuario.fueraDeServicio(
                            this.infocliente[index].correoprov);
                        Navigator.pushNamed(context, 'home');
                      }),
                ],
              ),
            ),
          );
        }
        return SafeArea(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20),
                RaisedButton.icon(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Text(
                      '    Apertura de negocio    ',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.lightBlueAccent,
                    icon: Icon(
                      FontAwesomeIcons.businessTime,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      final usuario = new UsuarioProvider();

                      usuario.aperturaDeServicio(
                          this.infocliente[index].correoprov);
                      Navigator.pushNamed(context, 'home');
                    }),
              ],
            ),
          ),
        );
      },
    );
  }
}
