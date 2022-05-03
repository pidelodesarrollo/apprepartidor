part of 'helpers.dart';

mostrarLoading(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: Text('Espere...'),
            content: LinearProgressIndicator(),
          ));
}

mostarAlert(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.of(context).pop())
            ],
          ));
}

mostarAlert2(BuildContext context, String titulo, String mensaje) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            title: Text(titulo),
            content: Text(mensaje),
            actions: [
              MaterialButton(
                  child: Text('Ok'),
                  onPressed: () => Navigator.pushNamed(context, 'home'))
            ],
          ));
}
