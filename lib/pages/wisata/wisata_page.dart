import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebon_ayu/colors/colors.dart';
import 'package:kebon_ayu/pages/profl_desa/profil_desa_page.dart';
import 'package:kebon_ayu/widgets/custom_appbar.dart';
import 'package:kebon_ayu/widgets/custom_drawer.dart';
import 'package:kebon_ayu/widgets/custom_footer.dart';

class WisataPage extends StatefulWidget {
  const WisataPage({super.key});

  @override
  State<WisataPage> createState() => _WisataPageState();
}

class _WisataPageState extends State<WisataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.hijauMuda,
      appBar: const CustomAppBar(),
      endDrawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(200, 40, 200, 40),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left side - "Profil Desa" text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Wisata',
                        style: GoogleFonts.bentham(
                          fontSize: 128,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration
                              .underline, // Menambahkan garis bawah
                        ),
                      ),
                    ],
                  ),

                  // Right side - Village logo
                  Image.asset(
                    'assets/logo_desa.png',
                    fit: BoxFit.cover,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Divider(
                color: Color(0xff1E1E1E),
                height: 2,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Kenali Kebon Ayu',
                    style: GoogleFonts.bentham(
                      fontSize: 64,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                children: [
                  Flexible(
                    child: CustomContainer(
                        nama: 'I Gede Bayu Balawa Tangub',
                        title: 'Kepala Desa'),
                  ),
                  SizedBox(width: 20),
                  Flexible(
                      child: CustomContainer(
                          nama: 'I Gede Bayu Balawa Tangub',
                          title: 'Kepala Desa')),
                  SizedBox(width: 20),
                  Flexible(
                      child: CustomContainer(
                          nama: 'I Gede Bayu Balawa Tangub',
                          title: 'Kepala Desa')),
                  SizedBox(width: 20),
                  Flexible(
                      child: CustomContainer(
                          nama: 'I Gede Bayu Balawa Tangub',
                          title: 'Kepala Desa')),
                ],
              ),
            ),
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: IntrinsicHeight(
                // Menyelaraskan tinggi anak-anak di dalam Row
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment
                      .stretch, // Membuat anak-anak dalam Row mengikuti tinggi yang tersedia
                  children: [
                    Container(
                      width: 420,
                      color: Colors
                          .white, // Tetap kosong tetapi mengikuti tinggi konten sebelahnya
                    ),
                    const SizedBox(width: 100),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Menyelaraskan konten di awal
                        children: [
                          Text(
                            'Cerita',
                            style: GoogleFonts.bentham(
                              fontSize: 64,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.',
                            style: GoogleFonts.bentham(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 100),
            const CustomFooter(),
          ],
        ),
      ),
    );
  }
}
