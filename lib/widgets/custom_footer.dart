import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kebon_ayu/colors/colors.dart';
import 'package:kebon_ayu/widgets/custom_text_white.dart';

class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.grey.shade800, Colors.grey.shade900],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          if (isMobile) _buildMobileLayout(context) else _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo Section
          Center(
            child: Image.asset(
              'assets/logo_mini.png',
              height: 45,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 25),

          // Navigation Menu
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.putih.withOpacity(0.1)),
                bottom: BorderSide(color: AppColors.putih.withOpacity(0.1)),
              ),
            ),
            child: Column(
              children: [
                _buildMobileNavItem('Profil Desa'),
                _buildMobileNavItem('Tradisi Budaya'),
                _buildMobileNavItem('Wisata'),
                _buildMobileNavItem('Kuliner'),
                _buildMobileNavItem('Tentang Kami'),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Contact Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(0.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: CustomTextWhite(
                    text: 'Kontak Kami',
                    size: 20,
                    weight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                // Phone number with icon
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColors.putih.withOpacity(0.2),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.phone,
                          color: AppColors.putih,
                          size: 18,
                        ),
                        SizedBox(width: 8),
                        CustomTextWhite(
                          text: '08986648730',
                          size: 16,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Social Media Icons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildMobileSocialButton(
                      FontAwesomeIcons.instagram,
                      () {},
                      'Instagram',
                    ),
                    const SizedBox(width: 20),
                    _buildMobileSocialButton(
                      FontAwesomeIcons.facebook,
                      () {},
                      'Facebook',
                    ),
                    const SizedBox(width: 20),
                    _buildMobileSocialButton(
                      FontAwesomeIcons.twitter,
                      () {},
                      'Twitter',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Feedback Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child: CustomTextWhite(
                  text: 'Saran & Masukan',
                  size: 20,
                  weight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: const TextField(
                  maxLines: null,
                  expands: true,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Tulis saran dan masukan Anda di sini...',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.putih.withOpacity(0.1),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                      side: BorderSide(
                        color: AppColors.putih.withOpacity(0.3),
                      ),
                    ),
                  ),
                  child: const CustomTextWhite(
                    text: 'Kirim',
                    size: 16,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMobileNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: CustomTextWhite(
          text: text,
          size: 16,
          weight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMobileSocialButton(
    IconData icon,
    VoidCallback onPressed,
    String label,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.putih.withOpacity(0.2),
            ),
          ),
          child: FaIcon(
            icon,
            color: AppColors.putih,
            size: 20,
          ),
        ),
        const SizedBox(height: 5),
        CustomTextWhite(
          text: label,
          size: 12,
          weight: FontWeight.w400,
        ),
      ],
    );
  }

  // Desktop layout methods remain the same
  Widget _buildDesktopLayout() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     const Color(0xFF2C3E50), // Dark blue-grey
          //     const Color(0xFF1A1A2E), // Deeper blue
          //   ],
          // ),
          ),
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 40),
      child: Column(
        children: [
          // Navigation Section
          Row(
            children: [
              Image.asset(
                'assets/logo_mini.png',
                height: 50,
              ),
              const Spacer(),
              Row(
                children: [
                  _buildNavItem('Profil Desa'),
                  _buildNavItem('Tradisi Budaya'),
                  _buildNavItem('Wisata'),
                  _buildNavItem('Kuliner'),
                  _buildNavItem('Tentang Kami'),
                ],
              ),
            ],
          ),

          // Divider with gradient
          Container(
            margin: const EdgeInsets.symmetric(vertical: 30),
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.putih.withOpacity(0.1),
                  AppColors.putih.withOpacity(0.5),
                  AppColors.putih.withOpacity(0.1),
                ],
              ),
            ),
          ),

          // Content Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Feedback Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.message_rounded,
                        color: AppColors.putih.withOpacity(0.9),
                        size: 24,
                      ),
                      const SizedBox(width: 10),
                      const CustomTextWhite(
                        text: 'Saran & Masukan',
                        size: 22,
                        weight: FontWeight.w500,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 390,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const TextField(
                      maxLines: null,
                      expands: true,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(15),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Tulis saran dan masukan Anda di sini...',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF3498DB), // Bright blue
                              const Color(0xFF2980B9), // Darker blue
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF3498DB).withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.send_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            CustomTextWhite(
                              text: 'Kirim',
                              size: 18,
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              // Contact Section
              Container(
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white.withOpacity(0.05),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.contact_phone_rounded,
                          color: AppColors.putih.withOpacity(0.9),
                          size: 24,
                        ),
                        const SizedBox(width: 10),
                        const CustomTextWhite(
                          text: 'Kontak Kami',
                          size: 22,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.phone_rounded,
                            color: AppColors.putih.withOpacity(0.9),
                            size: 20,
                          ),
                          const SizedBox(width: 10),
                          const CustomTextWhite(
                            text: '08986648730',
                            size: 18,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        _buildSocialButton(
                          FontAwesomeIcons.instagram,
                          () {},
                          const Color(0xFFE1306C), // Instagram color
                        ),
                        const SizedBox(width: 15),
                        _buildSocialButton(
                          FontAwesomeIcons.facebook,
                          () {},
                          const Color(0xFF1877F2), // Facebook color
                        ),
                        const SizedBox(width: 15),
                        _buildSocialButton(
                          FontAwesomeIcons.twitter,
                          () {},
                          const Color(0xFF1DA1F2), // Twitter color
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {},
          hoverColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.putih.withOpacity(0),
                  width: 2,
                ),
              ),
            ),
            child: CustomTextWhite(
              text: text,
              size: 18,
              weight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      IconData icon, VoidCallback onPressed, Color color) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.8),
                color.withOpacity(0.6),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: FaIcon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
