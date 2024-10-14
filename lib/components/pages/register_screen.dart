import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fundo preto
      appBar: AppBar(
        title: const Text('Registro'),
        backgroundColor: Colors.black, // AppBar preto
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Campo de Nome
            TextField(
              style: const TextStyle(color: Colors.white), // Texto branco
              decoration: const InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Colors.white), // Label branco
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Borda branca ao focar
                ),
              ),
            ),
            const SizedBox(height: 20),
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
            // Campo de Confirmação de Senha
            TextField(
              style: const TextStyle(color: Colors.white), // Texto branco
              decoration: const InputDecoration(
                labelText: 'Confirmar Senha',
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
            // Botão de Registro
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white, // Botão branco
                foregroundColor: Colors.black, // Texto preto
              ),
              onPressed: () {
                // Lógica de registro
              },
              child: const Text('Registrar'),
            ),
            const SizedBox(height: 20),
            // Link para Login
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Volta para a tela de login
              },
              child: const Text(
                'Já tem uma conta? Faça login',
                style: TextStyle(color: Colors.white), // Texto branco
              ),
            ),
          ],
        ),
      ),
    );
  }
}
