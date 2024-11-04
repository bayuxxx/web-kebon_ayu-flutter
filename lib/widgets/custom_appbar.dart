import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Jika layar lebih kecil dari 600 piksel, gunakan hamburger button
        if (constraints.maxWidth < 600) {
          return AppBar(
            title: const Text(
              'Kebon Ayu',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black.withOpacity(0.5),
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: const Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
              ),
            ],
          );
        } else {
          // Jika layar lebih besar dari 600 piksel, gunakan teks navigasi
          return AppBar(
            title: const Text(
              'Kebon Ayu',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black.withOpacity(0.5),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Profil Desa",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Tradisi Budaya",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Wisata",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Kuliner",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "Tentang Kami",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 20),
            ],
          );
        }
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
