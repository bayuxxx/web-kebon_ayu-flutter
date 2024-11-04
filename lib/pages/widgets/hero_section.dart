import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebon_ayu/widgets/custom_text_white.dart';

class HeroSection extends StatefulWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isLocationHovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: getResponsivePadding(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenWidth < 1200 ? 150 : 200),
            // Animated welcome text
            FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'SELAMAT DATANG',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getResponsiveFontSize(context, 64),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Animated subtitle with slight delay
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'DI DESA WISATA KEBON AYU',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: getResponsiveFontSize(context, 64),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            // Animated description text with more delay
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: Text(
                  'Melalui website ini, kami mengundang Anda untuk menjelajahi lebih jauh segala keunikan dan\nkeindahan yang ditawarkan Desa Kebon Ayu. Temukan informasi lengkap mengenai destinasi\nwisata, budaya, penginapan, kegiatan lokal, dan berbagai pengalaman menarik lainnya yang bisa\nAnda nikmati di desa kami.',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: getResponsiveFontSize(context, 14),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            // Animated location button
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
              ),
              child: SlideTransition(
                position: _slideAnimation,
                child: FittedBox(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => setState(() => _isLocationHovered = true),
                    onExit: (_) => setState(() => _isLocationHovered = false),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
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
                          Flexible(
                            child: CustomTextWhite(
                              text: 'Lokasi',
                              size: getResponsiveFontSize(context, 24),
                              weight: FontWeight.w400,
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 20),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            transform: Matrix4.identity()
                              ..translate(_isLocationHovered ? 5.0 : 0.0, 0.0),
                            child: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenWidth < 1200 ? 150 : 200),
            // Animated divider
            FadeTransition(
              opacity: CurvedAnimation(
                parent: _controller,
                curve: const Interval(0.8, 1.0, curve: Curves.easeIn),
              ),
              child: const Divider(color: Colors.white),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
