import 'package:flutter/material.dart';
import 'api_service.dart';

class TeamsPage extends StatefulWidget {
  const TeamsPage({super.key}); 
  @override
  TeamsPageState createState() => TeamsPageState();
}

class TeamsPageState extends State<TeamsPage> {
  late Future<List<String>> teams;

  @override
  void initState() {
    super.initState();
    teams = ApiService().fetchTeams(); // Haal de teams op
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teams'),
        backgroundColor: const Color(0xFF680735),
      ),
      backgroundColor: const Color(0xFF680735),
      body: FutureBuilder<List<String>>(
        future: teams,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No teams available'));
          } else {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: snapshot.data!.map((teamName) {
                  return buildTeamButton(teamName);
                }).toList(),
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildTeamButton(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          // Voeg hier acties toe als een team wordt geselecteerd
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF680735),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
