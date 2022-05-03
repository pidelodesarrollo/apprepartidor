part of 'widgets.dart';

class BtnSeguirUbicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapaBloc, MapaState>(
        builder: (context, state) => this._crearBoton(context, state));
  }

  Widget _crearBoton(BuildContext context, MapaState state) {
    // ignore: deprecated_member_use
    // final mapaBloc = context.bloc<MapaBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            state.seguirUbicacion
                ? Icons.directions_run
                : Icons.accessibility_new,
            color: Colors.transparent,
          ),
          onPressed: () {
            //mapaBloc.add(OnSeguirUbicacion());
          },
        ),
      ),
    );
  }
}
