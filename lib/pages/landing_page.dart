import 'package:flutter/material.dart';
import 'package:kebon_ayu/colors/colors.dart';
import 'package:kebon_ayu/pages/widgets/hero_section.dart';
import 'package:kebon_ayu/widgets/custom_appbar.dart';
import 'package:kebon_ayu/widgets/custom_footer.dart';
import 'package:kebon_ayu/widgets/custom_text_white.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double getResponsiveFontSize(BuildContext context, double baseSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 1200) {
      return baseSize * 0.75;
    } else if (screenWidth > 1600) {
      return baseSize * 1.2;
    }
    return baseSize;
  }

  EdgeInsets getResponsivePadding(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 1200) {
      return const EdgeInsets.symmetric(horizontal: 30);
    } else if (screenWidth > 1600) {
      return const EdgeInsets.symmetric(horizontal: 80);
    }
    return const EdgeInsets.symmetric(horizontal: 50);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      endDrawer: Drawer(
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Hero Section
            const HeroSection(),
            // Description Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.hijauTua,
              ),
              child: Padding(
                padding: getResponsivePadding(context),
                child: Column(
                  children: [
                    CustomTextWhite(
                      text: 'KEBON AYU',
                      size: getResponsiveFontSize(context, 24),
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 1200 ? 60 : 120,
                      ),
                      child: CustomTextWhite(
                        align: TextAlign.center,
                        text:
                            'Sebuah desa wisata yang terletak di Kabupaten Lombok Barat, Nusa Tenggara Barat, Indonesia. Yang dikenal karena kekayaan budayanya, tradisi yang masih terjaga, serta keindahan alamnya yang asri. Desa Kebon Ayu menawarkan pengalaman wisata yang beragam, mulai dari kerajinan tangan tradisional seperti anyaman dan tenun, hingga wisata alam seperti persawahan dan pemandangan pedesaan yang hijau.',
                        size: getResponsiveFontSize(context, 24),
                        weight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 1200 ? 60 : 120,
                      ),
                      child: CustomTextWhite(
                        align: TextAlign.center,
                        text:
                            'Selain itu, Kebon Ayu juga memiliki berbagai atraksi budaya, termasuk Peresean yang mencerminkan kekayaan warisan leluhur. Penduduk setempat sangat ramah dan terbuka untuk berbagi pengetahuan mereka tentang adat istiadat dan cara hidup yang telah berlangsung selama bertahun-tahun. Kebon Ayu juga aktif dalam mengembangkan konsep ekowisata dan pariwisata berkelanjutan, sehingga pengunjung dapat menikmati keindahan alam dan budaya lokal sambil berkontribusi pada pelestarian lingkungan dan kesejahteraan masyarakat setempat.',
                        size: getResponsiveFontSize(context, 24),
                        weight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Divider(color: Colors.white),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // About Village Section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bg_tentang.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: getResponsivePadding(context),
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    CustomTextWhite(
                      text: 'TENTANG DESA',
                      size: getResponsiveFontSize(context, 24),
                      weight: FontWeight.w400,
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth < 1200 ? 40 : 80,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          return Row(
                            children: List.generate(
                              4,
                              (index) => Expanded(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal:
                                        constraints.maxWidth < 1000 ? 5 : 10,
                                  ),
                                  color: Colors.white,
                                  height: screenWidth < 1200 ? 350 : 450,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: screenWidth < 1200 ? 100 : 143),
                  ],
                ),
              ),
            ),
            //maps section
            Container(
              width: double.infinity,
              height: 600,
              color: Colors.white,
            ),
            //Footer Section
            // Container(
            //   width: double.infinity,
            //   color: Colors.grey,
            //   height: 500,
            //   padding: const EdgeInsets.symmetric(horizontal: 60),
            //   child: Column(
            //     children: [
            //       const SizedBox(height: 20),
            //       Row(
            //         children: [
            //           Image.asset('assets/logo_mini.png'),
            //           Row(
            //             children: [
            //               const SizedBox(width: 40),
            //               InkWell(
            //                 onTap: () {},
            //                 child: const CustomTextWhite(
            //                   text: 'Profil Desa',
            //                   size: 20,
            //                   weight: FontWeight.w400,
            //                 ),
            //               ),
            //               const SizedBox(width: 40),
            //               InkWell(
            //                 onTap: () {},
            //                 child: const CustomTextWhite(
            //                   text: 'Tradisi Budaya',
            //                   size: 20,
            //                   weight: FontWeight.w400,
            //                 ),
            //               ),
            //               const SizedBox(width: 40),
            //               InkWell(
            //                 onTap: () {},
            //                 child: const CustomTextWhite(
            //                   text: 'Wisata',
            //                   size: 20,
            //                   weight: FontWeight.w400,
            //                 ),
            //               ),
            //               const SizedBox(width: 40),
            //               InkWell(
            //                 onTap: () {},
            //                 child: const CustomTextWhite(
            //                   text: 'Kuliner',
            //                   size: 20,
            //                   weight: FontWeight.w400,
            //                 ),
            //               ),
            //               const SizedBox(width: 40),
            //               InkWell(
            //                 onTap: () {},
            //                 child: const CustomTextWhite(
            //                   text: 'Tentang Kami',
            //                   size: 20,
            //                   weight: FontWeight.w400,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //       const Divider(
            //         color: AppColors.putih,
            //       ),
            //       const SizedBox(height: 20),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const CustomTextWhite(
            //                 text: 'Saran & Masukan',
            //                 size: 20,
            //                 weight: FontWeight.w400,
            //               ),
            //               const SizedBox(height: 20),
            //               Container(
            //                 width: 390,
            //                 height: 120,
            //                 color: Colors.white,
            //                 child: const TextField(
            //                   maxLines: null,
            //                   expands: true,
            //                   decoration: InputDecoration(
            //                     contentPadding: EdgeInsets.all(10),
            //                   ),
            //                 ),
            //               ),
            //               const SizedBox(height: 20),
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                   padding: const EdgeInsets.symmetric(
            //                     horizontal: 30,
            //                   ),
            //                   decoration: BoxDecoration(
            //                       border: Border.all(
            //                           color: AppColors.putih, width: 1)),
            //                   child: const CustomTextWhite(
            //                     text: 'Kirim',
            //                     size: 24,
            //                     weight: FontWeight.w400,
            //                   ),
            //                 ),
            //               )
            //             ],
            //           ),
            //           Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               const CustomTextWhite(
            //                 text: 'Kontak Kami',
            //                 size: 20,
            //                 weight: FontWeight.w400,
            //               ),
            //               SizedBox(height: 10),
            //               const CustomTextWhite(
            //                 text: '08986648730',
            //                 size: 20,
            //                 weight: FontWeight.w400,
            //               ),
            //               SizedBox(height: 20),
            //               Row(
            //                 children: [
            //                   IconButton(
            //                     icon: const FaIcon(FontAwesomeIcons.instagram),
            //                     onPressed: () {},
            //                   ),
            //                   IconButton(
            //                     icon: const FaIcon(FontAwesomeIcons.facebook),
            //                     onPressed: () {},
            //                   ),
            //                   IconButton(
            //                     icon: const FaIcon(FontAwesomeIcons.twitter),
            //                     onPressed: () {},
            //                   ),
            //                 ],
            //               )
            //             ],
            //           )
            //         ],
            //       ),
            //     ],
            //   ),
            // )
            CustomFooter()
          ],
        ),
      ),
    );
  }
}
