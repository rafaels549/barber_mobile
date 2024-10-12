import 'package:flutter/material.dart';
import '../header.dart';
import '../footer.dart';

class BasePage extends StatelessWidget {
  final Widget body;
  final int currentIndex; // Adicionando o parâmetro currentIndex
  final ValueChanged<int> onTap; // Adicionando o parâmetro onTap

  const BasePage({
    super.key,
    required this.body,
    required this.currentIndex, // Requerido
    required this.onTap, // Requerido
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(title: 'Barbearia App'), // Header fixo
      body: body, // O conteúdo da página
      bottomNavigationBar: Footer(
        currentIndex: currentIndex, // Passando currentIndex
        onTap: onTap, // Passando onTap
      ),
    );
  }
}
