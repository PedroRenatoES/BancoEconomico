// En adapters/ui/pantalla_login.dart
import 'package:flutter/material.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_cuentas.dart';

class PantallaLogin extends StatelessWidget {
  final TextEditingController _claveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 204, 34, 43), // Fondo rojo oscuro
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              'assets/banco_logo.jpg', 
              width: 350, 
              height: 350, 
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            // Campo de texto para la clave
            TextField(
              controller: _claveController,
              obscureText: true,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                labelText: '************',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _claveController,
              obscureText: true,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                labelText: 'Clave de acceso',
                labelStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Botón "Continuar"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaCuentas()),
                  );
                },
                child: Text(
                  'Continuar',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Botón de recuperación de usuario/contraseña
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaCuentas()),
                  );
                },
                child: Text(
                  'No Tengo u olvide mi usuario/contraseña',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Botón para abrir una cuenta
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[900],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                    Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PantallaCuentas()),
                  );
                },
                child: Text(
                  'Abre tu primera cuenta',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
