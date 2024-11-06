import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_pagos.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_transferencias.dart';

class PantallaCuentas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/banco_logo.jpg',
          width: 150,
          height: 150,
          fit: BoxFit.contain,
        ),
        backgroundColor: const Color.fromARGB(255, 204, 34, 43), // Color rojo oscuro
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Texto de bienvenida
              Center(
                child: Column(
                  children: [
                    Text(
                      'Bienvenido(a)',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'PEDRO RENATO ESCOBAR ORTUÑO',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Sección de "Cajas de ahorro"
              Text(
                'Cajas de ahorro',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Tarjeta de cuenta de ahorro
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  title: Text(
                    'PREMIUM DIGITAL',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Nro: 1091852404'),
                  trailing: Text(
                    'Bs36.08',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Sección de "Tarjetas de débito"
              Text(
                'Tarjetas de débito',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              // Primera tarjeta de débito
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  title: Text(
                    'NORMAL CON CVV2 CONTACTLESS',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Nro: 479314XXXXXX4414'),
                ),
              ),
              SizedBox(height: 10),
              // Segunda tarjeta de débito
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  title: Text(
                    'MANILLA DE PAGO',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Nro: 479314XXXXXX9506'),
                ),
              ),
              SizedBox(height: 20),
              // Scroll horizontal con accesos rápidos o tarjetas adicionales
              Text(
                'Accesos rápidos',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildQuickAccessCard('assets/bancoPublicidad1.jpeg'),
                    SizedBox(width: 10),
                    _buildQuickAccessCard('assets/bancoPublicidad2.jpeg'),
                    SizedBox(width: 10),
                    _buildQuickAccessCard('assets/bancoPublicidad3.jpeg'),
                    SizedBox(width: 10),
                    _buildQuickAccessCard('assets/bancoPublicidad4.jpeg'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Botones adicionales en la parte inferior
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomButtonWithImage('SmartPlay', Colors.white, 'assets/phone.jpg' ),
                  _buildBottomButtonWithImage('Club de Beneficios', Colors.white, 'assets/red-cart.png'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 204, 34, 43),
        unselectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 1) { // 1 corresponde al índice de "Transferir"
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaTransferencias()),
            );
          }
          if (index == 2) { 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaPagos()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Transferir',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pagos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.phone_iphone),
            label: 'Efectivo Móvil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.apps),
            label: 'Más',
          ),
        ],
      ),
    );
  }

  // Widget helper para crear las tarjetas de acceso rápido con imagen
  Widget _buildQuickAccessCard(String imagePath) {
    return Container(
      width: 400,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            width: 400,
            height: 250,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  // Widget helper para crear los botones en la parte inferior con imagen en lugar de icono
  Widget _buildBottomButtonWithImage(String label, Color color, String imagePath) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton.icon(
          onPressed: () {
            // Acción del botón
          },
          icon: Image.asset(
            imagePath,
            width: 22,
            height: 22,
          ),
          label: Text(label, style: TextStyle(color: const Color.fromARGB(255, 204, 34, 43))),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
