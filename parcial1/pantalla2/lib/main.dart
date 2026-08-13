import 'package:flutter/material.dart';

// Punto de entrada de la aplicacion
void main() {
  runApp(const MyApp());
}

// Widget raiz de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // quita la cinta roja de "debug"
      home: AddMoneyScreen(), // esta es nuestra pantalla estatica
    );
  }
}

// Pantalla "Add money" (Pantalla 2)
// Es ESTATICA: no tiene navegacion ni logica, solo widgets visuales
class AddMoneyScreen extends StatelessWidget {
  const AddMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // SafeArea evita que el contenido choque con la barra de estado
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------- ENCABEZADO ----------
              Row(
                children: const [
                  Icon(Icons.arrow_back_ios, size: 18),
                  SizedBox(width: 80), // espacio para centrar el texto
                  Text(
                    'Add money',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // ---------- TITULO "Select card" ----------
              const Text(
                'Select card',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // ---------- FILA DE TARJETAS ----------
              Row(
                children: [
                  // Tarjeta verde (seleccionada, tiene borde negro)
                  Container(
                    width: 100,
                    height: 80,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Debit card', style: TextStyle(fontSize: 10)),
                        Text('•••• 4568', style: TextStyle(fontSize: 10)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Tarjeta negra (Visa)
                  Container(
                    width: 100,
                    height: 80,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Credit card', style: TextStyle(fontSize: 10, color: Colors.white)),
                        Text('•••• 2478', style: TextStyle(fontSize: 10, color: Colors.white)),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10),

                  // Tercera tarjeta (se ve solo un pedacito, como en la imagen)
                  Container(
                    width: 30,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // ---------- TITULO "Add money to Neobank" ----------
              const Text(
                'Add money to Neobank',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 10),

              // ---------- LISTA DE OPCIONES ----------
              // Cada opcion es una fila: icono + texto + flecha
              _opcionFila(Icons.attach_money, 'Move your direct deposit'),
              _opcionFila(Icons.swap_horiz, 'Transfer from other banks'),
              _opcionFila(Icons.apple, 'Apple Pay'),
              _opcionFila(Icons.credit_card, 'Debit / Credit Card'),
            ],
          ),
        ),
      ),
    );
  }

  // Funcion que arma una fila de opcion (para no repetir codigo 4 veces)
  Widget _opcionFila(IconData icono, String texto) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(icono, size: 20),
          const SizedBox(width: 12),
          // Expanded hace que el texto ocupe el espacio disponible
          Expanded(
            child: Text(texto, style: const TextStyle(fontSize: 14)),
          ),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}