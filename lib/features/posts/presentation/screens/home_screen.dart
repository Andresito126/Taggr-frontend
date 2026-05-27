import 'package:flutter/material.dart';
import 'package:taggr/features/posts/presentation/components/post_card.dart';
import 'package:taggr/shared/components/title_section.dart';
import 'package:taggr/shared/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: TitleSection(
          title: "TAGGR",
          svgIconPath: "assets/logos/taggr_logo.svg",
          sizeFont: 36,
        ),
        //      titleSpacing: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(color: AppColors.borderWhite, height: 1.0),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          //          child: Padding(
          //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              PostCard(
                imageUrl: "assets/imgs/graffiti_img.png",
                category: "Graffiti",
                userName: "AndreJu",
                title: "Jungle",
                description: "This is a graffit very fkn cool babe",
                likes: 10,
                comments: 20,
              ),
              PostCard(
                imageUrl: "assets/imgs/tatto_img.png",
                category: "Tatto",
                userName: "AndreJu",
                title: "Tatto",
                description: "This is a graffit very fkn cool babe",
                likes: 12,
                comments: 18,
              ),
            ],
          ),
        ),
      ),
      //     ),
    );
  }
}
