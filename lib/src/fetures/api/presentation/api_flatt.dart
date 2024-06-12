import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JokesScreen extends StatefulWidget {
  const JokesScreen({Key? key});

  @override
  State<JokesScreen> createState() => _JokesScreenState();
}

class _JokesScreenState extends State<JokesScreen> {
  // State
  String joke = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Joke App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              joke,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            OutlinedButton.icon(
              onPressed: () async {
                // api.chucknorris.io /jokes/random
                final response =
                    await get(Uri.https('api.chucknorris.io', 'jokes/random'));

                
                String jsonString = response.body;

                Map<String, dynamic> m = jsonDecode(jsonString);

                setState(() {
                  joke = m["value"];
                });
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.red,
                side: BorderSide(color: Colors.red),
              ),
              icon: Icon(Icons.emoji_emotions_outlined,size: 50,),
              label: Text("Get a Joke!"),
            ),
          ],
        ),
      ),
    );
  }
}
