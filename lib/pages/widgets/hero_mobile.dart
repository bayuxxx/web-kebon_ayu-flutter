import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebon_ayu/widgets/custom_text_white.dart';

class HeroSectionMobile extends StatelessWidget {
  const HeroSectionMobile({Key? key}) : super(key: key);

  double getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 600) {
      return baseSize * 0.7; // Ukuran font lebih kecil untuk layar kecil
    }
    return baseSize;
  }

  EdgeInsets getResponsivePadding(BuildContext context) {
    return const EdgeInsets.symmetric(horizontal: 20); // Padding diubah menjadi 20px
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getResponsivePadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100), // Ruang untuk judul
          Text(
            'SELAMAT DATANG',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'DI DESA WISATA KEBON AYU',
            style: TextStyle(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, 36),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Melalui website ini, kami mengundang Anda untuk menjelajahi lebih jauh segala keunikan dan\n'
            'keindahan yang ditawarkan Desa Kebon Ayu. Temukan informasi lengkap mengenai destinasi\n'
            'wisata, budaya, penginapan, kegiatan lokal, dan berbagai pengalaman menarik lainnya yang bisa\n'
            'Anda nikmati di desa kami.',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: getResponsiveFontSize(context, 12),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 40),
          // Animated location button
          FittedBox(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextWhite(
                      text: 'Lokasi',
                      size: getResponsiveFontSize(context, 24),
                      weight: FontWeight.w400,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(width: 20),
                    const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          const Divider(color: Colors.white),
        ],
      ),
    );
  }
}
