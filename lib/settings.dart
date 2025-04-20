import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings'), backgroundColor: Colors.orange),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('profile'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('home'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
