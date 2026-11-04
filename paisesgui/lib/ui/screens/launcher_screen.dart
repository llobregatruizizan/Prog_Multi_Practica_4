import 'package:flutter/material.dart';

// En primer lugar, definimos el widget como un widget con estado
class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  // Sobreescrimbimos el método createState() para crear el estado  @override
  State<LauncherScreen> createState() => _LauncherScreen();
}

// Clase para el estado
class _LauncherScreen extends State<LauncherScreen> {
  // Definimos el contenido como propiedad
  String? contenido;

  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializamos el contenido
    contenido = "";
  }

  // Construimos el widget
  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Iniciar Sesión",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 20),

                // Campo de correo electrónico
                TextField(
                  controller: correoController,
                  decoration: InputDecoration(
                    labelText: "Correo electrónico",
                    prefixIcon: const Icon(Icons.email_rounded),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Campo de contraseña
                TextField(
                    controller: contrasenaController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Contraseña",
                    prefixIcon: const Icon(Icons.lock),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                // Botón de inicio de sesión
                ElevatedButton(
                  onPressed: () {
                    if (correoController.text == "izallorui@alu.edu.gva.es" &&
                        contrasenaController.text == "rV207e8t") {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(const SnackBar(content: Text("OK")));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Correo o contraseña incorrectos"),
                        ),
                      );
                    }
                  },
                  child: const Text("Iniciar sesión"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
