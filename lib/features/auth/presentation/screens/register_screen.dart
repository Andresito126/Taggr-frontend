import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taggr/shared/components/input_field.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset("assets/logos/taggr_logo.svg", height: 56),
                    const SizedBox(width: 16),
                    Text(
                      "TAGGR",
                      style: AppTextStyles.title.copyWith(
                        fontSize: 64,
                        height: 1.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  "Built for raw creativity",
                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border: Border.all(color: AppColors.borderWhite),
                  ),
                  child: Column(
                    children: [
                      InputField(
                        iconInput:Icons.person_outline,
                        textInput: "Username",
                        hTPlaceHolder: "urban_artist",
                        controller: _usernameController,
                      ),
                      const SizedBox(height: 20),

                      InputField(
                        iconInput:Icons.email_outlined,
                        textInput: "Email",
                        hTPlaceHolder: "your@email.com",
                        controller: _emailController,
                      ),
                      const SizedBox(height: 20),

                      InputField(
                        iconInput: Icons.password_outlined,
                        textInput: "Password",
                        hTPlaceHolder: "Your Password",
                        isPassword: true,
                        controller: _passwordController,
                      ),
                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.neonGreen,
                            foregroundColor: Colors.black,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: Text(
                            "SIGN UP",
                            style: AppTextStyles.title.copyWith(
                              color: Colors.black,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: AppTextStyles.caption.copyWith(
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Login",
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.neonGreen,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 40),

                Text(
                  "Street culture meets digital expression",
                  style: AppTextStyles.caption.copyWith(
                    color: Colors.white24,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
