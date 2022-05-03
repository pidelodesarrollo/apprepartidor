import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AccesoGpsPage extends StatefulWidget {
  @override
  _AccesoGpsPageState createState() => _AccesoGpsPageState();
}

class _AccesoGpsPageState extends State<AccesoGpsPage>
    with WidgetsBindingObserver {
  bool popup = false;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed && !popup) {
      if (await Permission.location.isGranted) {
        Navigator.pushReplacementNamed(context, 'laoding');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Es necesario activar el GPS para usar esta app¡¡'),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                child: Text(
                  'Solicitar Acceso',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.lightGreen,
                shape: StadiumBorder(),
                elevation: 0,
                splashColor: Colors.transparent,
                onPressed: () async {
                  popup = true;
                  final status = await Permission.location.request();
                  await this.accesoGps(status);
                  popup = false;
                })
          ],
        ),
      ),
    );
  }

  Future accesoGps(PermissionStatus status) async {
    print(status);

    switch (status) {
      case PermissionStatus.granted:
        await Navigator.pushReplacementNamed(context, 'loading');
        break;

      case PermissionStatus.undetermined:
      case PermissionStatus.denied:
      case PermissionStatus.restricted:
      case PermissionStatus.permanentlyDenied:
        openAppSettings();
    }
  }
}

//class WidgetsBindingsObserver {}
