import 'package:flutter/material.dart';
import 'components/service_booking_modal.dart'; // Certifique-se de ajustar o caminho

class BarberShopPage extends StatelessWidget {
  const BarberShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barbearia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://via.placeholder.com/600x300',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Bem-vindo à nossa Barbearia!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              ),
              onPressed: () {
                _showBookingModal(context); // Exibe o modal
              },
              child: const Text('Agendar Agora'),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Nossos Serviços:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ListTile(
                  title: Text('Corte de Cabelo'),
                  subtitle: Text('Corte clássico e moderno'),
                ),
                ListTile(
                  title: Text('Barba'),
                  subtitle: Text('Aparação e modelagem de barba'),
                ),
                ListTile(
                  title: Text('Tratamento Capilar'),
                  subtitle: Text('Hidratação e cuidados com os cabelos'),
                ),
                ListTile(
                  title: Text('Penteado'),
                  subtitle: Text('Penteados para eventos especiais'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Função para exibir o modal
  void _showBookingModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ServiceBookingModal(
          onBookingConfirmed: (DateTime date, String service) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Agendado para ${date.toLocal()} - Serviço: $service'),
              ),
            );
          },
        );
      },
    );
  }
}
