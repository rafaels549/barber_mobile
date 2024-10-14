import 'package:flutter/material.dart';
import 'register_screen.dart'; // Importa a tela de registro

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.black, // AppBar preto
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de Email
            TextField(
              style: const TextStyle(color: Colors.white), // Texto branco
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white), // Label branco
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca ao focar
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            // Campo de Senha
            TextField(
              style: const TextStyle(color: Colors.white), // Texto branco
              decoration: const InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Colors.white), // Label branco
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca ao focar
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Botão de Login
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Botão branco
                foregroundColor: Colors.black, // Texto preto
              ),
              onPressed: () {
                // Navegação ou lógica de login
              },
              child: const Text('Login'),
            ),
            const SizedBox(height: 20),
            // Link para Registro
            TextButton(
              onPressed: () {
                // Navegar para a tela de registro
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
              child: const Text(
                'Não tem uma conta? Registre-se',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
            ),
          ],
        ),
      ),
    );
  }
}
