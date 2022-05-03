import 'package:negocioapp/src/models/importe_model.dart';
//import 'package:negocioapp/src/providers/categorias_provider.dart';
import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:provider/provider.dart';

class Ventas7DiasAtras extends StatelessWidget {
  final List<Importe> importe;

  const Ventas7DiasAtras({@required this.importe});

  @override
  Widget build(BuildContext context) {
    //final categoryService =
    //    Provider.of<CategoryService>(context, listen: false);
    return ListView.builder(
      itemCount: this.importe.length,
      itemBuilder: (BuildContext context, int index) {
        if (this.importe[index].importe == null) {
          // categoryService.importePrecio = this.importe[index].precio;
          //print(categoryService.importePrecio);
          return Center(
            child: Text(
              'No tienes ventas de 7 dias atras',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          );
        }

        // categoryService.importePrecio = this.importe[index].importe;

        //print(categoryService.importePrecio);

        return Container(
          height: 30,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Tus venta de 7 dias atras: \$ ${this.importe[index].importe}',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // SizedBox(height: 10),
              /* Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      RaisedButton.icon(
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          color: Colors.orange[400],
                          textColor: Colors.white,
                          icon: FaIcon(FontAwesomeIcons.cashRegister, size: 15),
                          label: Text('Ordenar y Pagar'),
                          onPressed: () {
                            Navigator.pushNamed(context, 'tarjetahome');
                            //mostrarSnackbar('Sin soporte de sistema de pago');
                          })
                    ],
                  )
                  ), */
            ],
          ),
        );
      },
    );
  }
}
