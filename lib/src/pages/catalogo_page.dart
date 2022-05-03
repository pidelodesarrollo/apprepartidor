//import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:negocioapp/src/blocs/provider.dart';
import 'package:negocioapp/src/models/catalogo_model.dart';
import 'package:negocioapp/src/providers/usuario_provider.dart';

class CatalogPage extends StatefulWidget {
  static final String routeName = 'catalogo';

  @override
  _CatalogoPageState createState() => _CatalogoPageState();
}

class _CatalogoPageState extends State<CatalogPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final bloc = ProviderBloc.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catálogo de productos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Activa ó desactiva tus productos',
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  _catalogo(bloc),
                  //_crearCorreo(),
                  //SizedBox(
                  //  height: 20,
                  //),
                  //_metodoPago(),
                  //SizedBox(
                  // height: 40,
                  //),
                  //_crearBoton(),
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

  Widget _catalogo(LoginBloc bloc) {
    final usuarioProvider = new UsuarioProvider();

    return FutureBuilder(
      future: usuarioProvider.getListArt(bloc.email.toString()),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _crearArticulosListView(snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearArticulosListView(List<Catalogo> articulos) {
    return Container(
      color: Colors.grey[50],
      child: SizedBox(
        height: 400,
        child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: articulos.length,
            itemBuilder: (BuildContext context, int index) {
              return _ListaArt(articulo: articulos[index], index: index);
            }),
      ),
    );
  }

/*   Widget _crearNombre() {
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
  }  */

  // Widget _crearCorreo() {
  //   return TextFormField(
  //     initialValue: cliente.correo,
  //     //textCapitalization: TextCapitalization.sentences,
  //     decoration: InputDecoration(
  //       labelText: 'Correo Electrónico',
  //     ),
  //     onSaved: (value) => cliente.correo = value,
  //     validator: (value) {
  //       if (value.length < 3) {
  //         return 'Ingrese el correo del cliente';
  //       } else {
  //         return null;
  //       }
  //     },
  //   );
  // }

/*   Widget _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.lightGreen,
      textColor: Colors.white,
      label: Text('Actualizar'),
      icon: Icon(Icons.update),
      onPressed: _submit,
    );
  } */

  /* Widget _metodoPago() {
    return SwitchListTile(
        value: cliente.metodopago,
        title: Text('Pago Electronico'),
        activeColor: Colors.lightGreen,
        onChanged: (value) => setState(() {
              cliente.metodopago = value;
            }));
  } */

  /*  void _submit() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();
  } */

}

class _ListaArt extends StatelessWidget {
  final Catalogo articulo;
  final int index;

  const _ListaArt({@required this.articulo, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _TarjetaTopBar(articulo, index),
    ]);
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Catalogo articulo;
  final int index;

  const _TarjetaTopBar(this.articulo, this.index);

  @override
  Widget build(BuildContext context) {
    if (this.articulo.vigente.toString() == "Si") {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Color(0xFFB0CCE1).withOpacity(0.32),
              ),
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          margin: EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Column(
                children: [
                  Container(
                    width: 160,
                    child: Column(
                      children: [
                        Text(
                          articulo.nombre,
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Text('  \$ ${articulo.precio}',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 25,
                          width: 120.0,
                          child: RaisedButton.icon(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              color: Colors.lightBlue,
                              textColor: Colors.white,
                              label: Text(
                                'Existencia',
                                style: TextStyle(fontSize: 12),
                              ),
                              icon: Icon(
                                Icons.check,
                                size: 0.0,
                              ),
                              onPressed: () {
                                final usuarioProvider = new UsuarioProvider();
                                usuarioProvider.articulosinexistencia(
                                    articulo.idarticulos);
                                Navigator.pushReplacementNamed(context, 'home');
                                //final bloc = ProviderBloc.of(context);

                                /*¡¡¡ final negocioprovider = new NegociosProvider();
                              negocioprovider.pedirArticulo(
                                  articulo.idproveedor,
                                  bloc.email,
                                  articulo.nombre,
                                  articulo.precio); */
                                // showInfoFlushbar(context);
                              }),
                        )
                      ],
                    ),
                  ),
                  /* Text(articulo.nombre),
                Text('  \$ ${articulo.precio}'), */
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 7,
                          ),
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: GestureDetector(
                                child: FadeInImage(
                                  image:
                                      NetworkImage(articulo.getIconoArticulo()),
                                  placeholder:
                                      AssetImage('assets/img/no-image.jpg'),
                                  fit: BoxFit.cover,
                                  height: 85.0,
                                ),
                                onTap: () {
                                  /*  Navigator.pushNamed(context, 'detalleart',
                                      arguments: articulo); */
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xFFB0CCE1).withOpacity(0.32),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: 160,
                  child: Column(
                    children: [
                      Text(
                        articulo.nombre,
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      Text('  \$ ${articulo.precio}',
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w500)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 25,
                        width: 120.0,
                        child: RaisedButton.icon(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            color: Colors.lightBlue,
                            textColor: Colors.white,
                            label: Text(
                              'Sin Existencia',
                              style: TextStyle(fontSize: 12),
                            ),
                            icon: Icon(
                              Icons.check,
                              size: 0.0,
                            ),
                            onPressed: () {
                              final usuarioProvider = new UsuarioProvider();
                              usuarioProvider
                                  .articuloenexistencia(articulo.idarticulos);

                              Navigator.pushReplacementNamed(context, 'home');
                              //final bloc = ProviderBloc.of(context);

                              /*¡¡¡ final negocioprovider = new NegociosProvider();
                              negocioprovider.pedirArticulo(
                                  articulo.idproveedor,
                                  bloc.email,
                                  articulo.nombre,
                                  articulo.precio); */
                              // showInfoFlushbar(context);
                            }),
                      )
                    ],
                  ),
                ),
                /* Text(articulo.nombre),
                Text('  \$ ${articulo.precio}'), */
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5.0),
                            child: GestureDetector(
                              child: FadeInImage(
                                image:
                                    NetworkImage(articulo.getIconoArticulo()),
                                placeholder:
                                    AssetImage('assets/img/no-image.jpg'),
                                fit: BoxFit.cover,
                                height: 85.0,
                              ),
                              onTap: () {
                                //Navigator.pushNamed(context, 'detalleart',
                                // arguments: articulo);
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  /*  void showInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'El articulo ha sido agregado',
      message: 'Por favor revisa tu carrito para mas detalles',
      icon: Icon(
        Icons.check,
        size: 28,
        color: Colors.blue.shade300,
      ),
      leftBarIndicatorColor: Colors.blue.shade300,
      duration: Duration(seconds: 3),
    )..show(context);
  } */
}
