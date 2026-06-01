import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:taggr/features/auth/presentation/providers/auth_provider.dart';
import 'package:taggr/features/auth/presentation/providers/auth_ui_state.dart';
import 'package:taggr/shared/components/input_field.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 130),

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
                "Where underground creativity lives",
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              SizedBox(height: 16),

              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  border: Border.all(color: AppColors.borderGrey),
                ),
                child: Column(
                  children: [
                    InputField(
                      textInput: "Email",
                      hTPlaceHolder: "your@email.com",
                      iconInput: Icons.email_outlined,
                      controller: _emailController,
                    ),

                    SizedBox(height: 16),

                    InputField(
                      textInput: "Password",
                      hTPlaceHolder: "Your Password",
                      iconInput: Icons.password_outlined,
                      isPassword: true,
                      controller: _passwordController,
                    ),

                    SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Consumer<AuthProvider>(
                        builder: (context, authProvider, child) {
                          // checo si esta cargando para deshabilitar el boton
                          final isLoading = authProvider.state is AuthLoading;

                          return ElevatedButton(
                            // si anda cargando, pasamos null para que no le puedan hacer doble clic
                            onPressed: isLoading ? null : () async {
                              final email = _emailController.text.trim();
                              final password = _passwordController.text.trim();

                              // vlidación rápida
                              if (email.isEmpty || password.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Llena todos los campos.")),
                                );
                                return;
                              }

                              // va al back
                              await authProvider.login(email, password);

                              // se verifica la pantalla
                              if (!context.mounted) return;

                              // ya vemos el resulttttt
                              if (authProvider.state is AuthSuccess) {
                                Navigator.pushReplacementNamed(context, '/home');
                              } else if (authProvider.state is AuthError) {
                                final errorMsg = (authProvider.state as AuthError).message;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(errorMsg, style: const TextStyle(color: Colors.white)),
                                    backgroundColor: Colors.redAccent,
                                  ),
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.neonGreen,
                              foregroundColor: Colors.black,
                              disabledBackgroundColor: Colors.grey.shade800, 
                              elevation: 0,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                            ),
                            child: isLoading
                                ? const SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 3,
                                    ),
                                  )
                                : Text(
                                    "LOGIN", 
                                    style: AppTextStyles.title.copyWith(
                                      color: Colors.black,
                                      fontSize: 24,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Do not You have an account?",
                          style: AppTextStyles.caption,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/register');
                          },
                          child: Text(
                            " Sign Up",
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
                "Tag your art. Leave your mark.",
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
