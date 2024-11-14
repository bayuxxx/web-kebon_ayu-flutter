import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white.withOpacity(0.8),
      surfaceTintColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: const Text('Profil Desa'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Tradisi Budaya'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Wisata'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Kuliner'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Tentang Kami'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
