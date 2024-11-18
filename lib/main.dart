import 'package:flutter/material.dart';
import 'team_page.dart'; // Importeer de nieuwe pagina

void main() => runApp(const GatherlyApp());

class GatherlyApp extends StatelessWidget {
  const GatherlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gatherly',
      theme: ThemeData(
        primaryColor: const Color(0xFF680735), // Donkerrode kleur
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF680735), // Donkerrode kleur
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold), // Witte tekst
          iconTheme: IconThemeData(color: Colors.white), // Witte iconen
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Gatherly'), // Deze tekst is nu wit vanwege het AppBarTheme
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              width: 120,
              height: 120,
              child: Image.asset('assets/logo.png'),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  buildMenuButton('PLANNING', Icons.schedule, context),
                  buildMenuButton('EVENTS', Icons.event, context),
                  buildMenuButton('WEDSTRIJDEN', Icons.sports_tennis, context),
                  buildMenuButton('TEAMS', Icons.group, context, navigateToTeams: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(String title, IconData icon, BuildContext context, {bool navigateToTeams = false}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF680735), // Donkerrode kleur
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
      ),
      onPressed: () {
        if (navigateToTeams) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TeamsPage()), // Navigeer naar het tweede scherm
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
