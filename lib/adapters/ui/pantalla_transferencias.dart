import 'package:flutter/material.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_cuentas.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_pagos.dart';

class PantallaTransferencias extends StatefulWidget {
  @override
  _PantallaTransferenciasState createState() => _PantallaTransferenciasState();
}

class _PantallaTransferenciasState extends State<PantallaTransferencias> {
  bool esBeneficiarios = false;
  bool mostrarQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/banco_logo.jpg', // Asegúrate de reemplazar esta ruta con la correcta para tu imagen
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 204, 34, 43),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: mostrarQR
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            esBeneficiarios = false;
                            mostrarQR = false;
                          });
                        },
                        child: Text(
                          'Transferir',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: esBeneficiarios ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            esBeneficiarios = false;
                            mostrarQR = false;
                          });
                        },
                        child: Text(
                          'Beneficiarios',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: esBeneficiarios ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.qr_code_scanner),
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            mostrarQR = true;
                          });
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Text(
                      "Cobros QR",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Card para Cobro con QR
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.qr_code),
                      title: Text("Cobro con QR"),
                      subtitle: Text("Genera un código QR para cobrar a otra persona"),
                    ),
                  ),
                  
                  // Título de Pagos QR
                  Center(
                    child: Text(
                      "Pagos QR",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Card para Pagar con QR
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.camera_alt),
                      title: Text("Pagar con QR"),
                      subtitle: Text("Usa la cámara para escanear el código QR"),
                    ),
                  ),
                  // Card para Pagar QR desde la Galería
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.image),
                      title: Text("Pagar QR desde la Galería"),
                      subtitle: Text("Selecciona una imagen QR desde la galería"),
                    ),
                  ),
                  
                  // Título de Domicíliate
                  Center(
                    child: Text(
                      "Domicíliate",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Card para Domicíliate
                  Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(Icons.repeat),
                      title: Text("Domicíliate con QR"),
                      subtitle: Text(
                          "Simplifica tus pagos mensuales por prestación de servicios o tus compras a cuotas leyendo el QR que generaron para ti para \"Domiciliación\""),
                    ),
                  ),
                  
                  // Botón de "Transferencias recientes"
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        // Acción para transferencias recientes
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: const Color.fromARGB(255, 204, 34, 43)),
                      ),
                      child: Text(
                        'Transferencias recientes',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 204, 34, 43),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Opciones de Transferir y Beneficiarios con QR
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            esBeneficiarios = false;
                            mostrarQR = false;
                          });
                        },
                        child: Text(
                          'Transferir',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: esBeneficiarios ? Colors.grey : Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            esBeneficiarios = true;
                            mostrarQR = false;
                          });
                        },
                        child: Text(
                          'Beneficiarios',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: esBeneficiarios ? Colors.black : Colors.grey,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.qr_code_scanner),
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            esBeneficiarios = false;
                            mostrarQR = true;
                          });
                        },
                      ),
                    ],
                  ),
                  if (esBeneficiarios)
                    ...[
                      // Campo de búsqueda y botón Añadir Beneficiario
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Busca un beneficiario',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              // Acción para añadir beneficiario
                            },
                            child: Text(
                              'Añadir Beneficiario',
                              style: TextStyle(
                                color: Color.fromARGB(255, 204, 34, 43),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'No existen registros',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ]
                  else
                    ...[
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Inicia una nueva Transferencia',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Busca un beneficiario',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          TextButton(
                            onPressed: () {
                              // Acción para añadir beneficiario
                            },
                            child: Text(
                              'Añadir Beneficiario',
                              style: TextStyle(
                                color: Color.fromARGB(255, 204, 34, 43),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Text(
                          'No existen registros',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: OutlinedButton(
                          onPressed: () {
                            // Acción para transferencias recientes
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: const Color.fromARGB(255, 204, 34, 43)),
                          ),
                          child: Text(
                            'Transferencias recientes',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 204, 34, 43),
                            ),
                          ),
                        ),
                      ),
                    ],
                ],
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 204, 34, 43),
        unselectedItemColor: Colors.black,
        currentIndex: 1,
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
        onTap: (index) {
          if (index == 0) {
            if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaCuentas()), // Asegúrate de que PantallaPagos esté importada
            );
          }
          } else if (index == 1) {
            // Navegar a la pantalla de Transferencias
          } else if (index == 2) {
            // Navegar a la pantalla de Pagos
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaPagos()), // Asegúrate de que PantallaPagos esté importada
            );
          } else if (index == 3) {
            // Navegar a la pantalla de Efectivo Móvil
          } else if (index == 4) {
            // Navegar a la pantalla de Más opciones
          }
        },
      ),

    );
  }
}
