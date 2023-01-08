import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_data/views/list_people.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ShowPeople(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const usertnameKey = 'username';
  String username = '';
  Future saveData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(usertnameKey, 'Soda');
    print('Save Success.');
  }

  Future readData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      username = preferences.getString(usertnameKey) ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(username),
            CupertinoButton(
              child: Text('Save'),
              onPressed: () {
                saveData();
              },
              color: Colors.red,
            ),
            const SizedBox(
              height: 20,
            ),
            CupertinoButton(
              child: const Text('Read'),
              onPressed: () {
                readData();
              },
              color: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
