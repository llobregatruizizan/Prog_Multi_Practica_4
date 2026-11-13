import 'package:flutter/material.dart';
import 'package:paisesgui/ui/screens/infopais_general.dart';
import 'package:paisesgui/ui/screens/infopais_detalle.dart';

class NavigationScreen extends StatefulWidget {
  final String nombrePais;

  const NavigationScreen({super.key, required this.nombrePais});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int indexActual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: [
          Text(
            'Información general',
            style: const TextStyle(fontFamily: "LeckerliOne", fontSize: 22),
          ),
          Text(
            'Población y tiempo',
            style: const TextStyle(fontFamily: "LeckerliOne", fontSize: 22),
          ),
        ][indexActual],
      ),

      bottomNavigationBar: NavigationBar(
        labelTextStyle: WidgetStateProperty.all(
          const TextStyle(fontFamily: "LeckerliOne"),
        ),
        onDestinationSelected: (int index) {
          setState(() {
            indexActual = index;
          });
        },

        selectedIndex: indexActual,

        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'General',
          ),

          NavigationDestination(
            icon: Icon(Icons.list_outlined),
            selectedIcon: Icon(Icons.list),
            label: 'Detalle',
          ),
        ],
      ),

      body: <Widget>[
        InfoPaisGeneral(nombrePais: widget.nombrePais),
        InfoPaisDetalle(nombrePais: widget.nombrePais),
      ][indexActual],
    );
  }
}
