import 'package:flutter/material.dart';
import 'barberShop.dart';
import 'components/pages/base_page.dart';
import 'components/pages/login_screen.dart';
import 'components/pages/register_screen.dart'; // Importando BasePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barbearia App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(), 
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreenContent(),
    Center(child: Text('Agendamentos')),
    Center(child: Text('Configurações')),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      body: _screens[_selectedIndex], // Passando o conteúdo da página
      currentIndex: _selectedIndex, // Passando o currentIndex
      onTap: _onItemTapped, // Passando a função onTap
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            elevation: 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://via.placeholder.com/300', // Substitua pela URL da imagem desejada
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Serviço 1',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Cor de fundo preta
                    foregroundColor: Colors.white, // Cor do texto branca
                  ),
                  onPressed: () {
                    // Navegando para a página da barbearia
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BarberShopPage(),
                      ),
                    );
                  },
                  child: const Text('Agendar Agora'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
