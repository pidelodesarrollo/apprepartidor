part of 'widgets.dart';

class BtnMiRuta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    final mapaBloc = context.bloc<MapaBloc>();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.more_horiz, color: Colors.transparent),
          onPressed: () {
            mapaBloc.add(OnMarcarRecorido());
          },
        ),
      ),
    );
  }
}
