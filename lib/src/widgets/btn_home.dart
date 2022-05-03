part of 'widgets.dart';

class BtnHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    //final mapaBloc = context.bloc<MapaBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 30,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
    );
  }
}
