import 'package:flutter/material.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_cuentas.dart';
import 'package:flutter_banco_economico/adapters/ui/pantalla_transferencias.dart';

class PantallaPagos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/banco_logo.jpg',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Inicia un nuevo pago',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            
            // Opciones de pago en dos filas de cuatro cards
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                buildPaymentOptionCard(Icons.lightbulb_outline, 'Servicios básicos'),
                buildPaymentOptionCard(Icons.wifi, 'Telefonía e Internet'),
                buildPaymentOptionCard(Icons.phone_android, 'Recarga de celular'),
                buildPaymentOptionCard(Icons.school, 'Educación'),
                buildPaymentOptionCard(Icons.account_balance, 'Impuestos, Gestora'),
                buildPaymentOptionCard(Icons.home_work, 'Expensas Condominios'),
                buildPaymentOptionCard(Icons.home, 'Pago terrenos, casas, deptos'),
                buildPaymentOptionCard(Icons.more_horiz, 'Otros'),
              ],
            ),

            SizedBox(height: 20),

            // Secciones de pagos anteriores
            buildPaymentSectionTitle('Pagados este mes'),
            Center(
              child: Text(
                'No existen registros',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            buildPaymentSectionTitle('Pagados anteriores meses'),
            
            Card(
              child: ListTile(
                title: Text('TIGO'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Celular: 78408389'),
                    Text('Pre-pago'),
                    Text('Último pago: Bs20.00 04/May/2024'),
                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey),
                  onPressed: () {
                    // Acción para eliminar pago
                  },
                ),
              ),
            ),
            SizedBox(height: 20),

            Center(
              child: OutlinedButton(
                onPressed: () {
                  // Acción para pagos recientes
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: const Color.fromARGB(255, 204, 34, 43)),
                ),
                child: Text(
                  'Pagos recientes',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 204, 34, 43),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      // BottomNavigationBar con el icono de Pagos en rojo
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromARGB(255, 204, 34, 43),
        unselectedItemColor: Colors.black,
        currentIndex: 2, // Marca "Pagos" como seleccionado
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaCuentas()), // Asegúrate de que PantallaPagos esté importada
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PantallaTransferencias()), // Asegúrate de que PantallaPagos esté importada
            );
          }
          // Aquí puedes agregar navegación para otras pantallas
        },
      ),
    );
  }

  // Método para crear una Card de opción de pago
  Widget buildPaymentOptionCard(IconData iconData, String text) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {
          // Acción para la opción de pago
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData, size: 30, color: Colors.grey[700]),
              SizedBox(height: 8),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método para construir un título de sección de pago
  Widget buildPaymentSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Expanded(
            child: Divider(color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
