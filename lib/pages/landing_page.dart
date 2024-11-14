import 'package:flutter/material.dart';
import 'package:kebon_ayu/colors/colors.dart';
import 'package:kebon_ayu/pages/widgets/hero_section.dart';
import 'package:kebon_ayu/pages/widgets/maps_section.dart';
import 'package:kebon_ayu/widgets/custom_appbar.dart';
import 'package:kebon_ayu/widgets/custom_drawer.dart';
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
      endDrawer: const CustomDrawer(),
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
                    const SizedBox(height: 10),
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
                    const SizedBox(height: 70),
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
            const Padding(
              padding: EdgeInsets.all(50),
              child: MapsSection(),
            ),
            const CustomFooter()
          ],
        ),
      ),
    );
  }
}
