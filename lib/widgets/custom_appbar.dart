import 'package:flutter/material.dart';
import 'package:kebon_ayu/pages/kuliner/kuliner_page.dart';
import 'package:kebon_ayu/pages/landing_page.dart';
import 'package:kebon_ayu/pages/profl_desa/profil_desa_page.dart';
import 'package:kebon_ayu/pages/tradisi_budaya/tradisi_budaya_page.dart';
import 'package:kebon_ayu/pages/wisata/wisata_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    void navigate(BuildContext context, Widget targetPage) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => targetPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = 0.0;
            const end = 1.0;
            const curve = Curves.easeInOut;

            final tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            final fadeAnimation = animation.drive(tween);

            return FadeTransition(
              opacity: fadeAnimation,
              child: child,
            );
          },
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
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
              // TextButton(
              //   onPressed: () {
              //     navigate(context, const LandingPage());
              //   },
              //   child: const Text(
              //     "Home",
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              TextButton(
                onPressed: () {
                  navigate(context, const ProfilDesaPage());
                },
                child: const Text(
                  "Profil Desa",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  navigate(context, const TradisiBudayaPage());
                },
                child: const Text(
                  "Tradisi Budaya",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  navigate(context, const WisataPage());
                },
                child: const Text(
                  "Wisata",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  navigate(context, const KulinerPage());
                },
                child: const Text(
                  "Kuliner",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  navigate(context, const LandingPage());
                },
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
