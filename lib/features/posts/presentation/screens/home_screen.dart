import 'package:flutter/material.dart';
import 'package:taggr/features/posts/presentation/components/post_card.dart';
import 'package:taggr/features/posts/presentation/providers/post_provider.dart';
import 'package:taggr/features/posts/presentation/providers/post_ui_state.dart';
import 'package:taggr/shared/components/title_section.dart';
import 'package:taggr/shared/theme/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:taggr/shared/theme/app_text_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostProvider>().loadPosts();
    });
  }

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
        child: Consumer<PostProvider>(
          builder: (context, provider, child) {
            //pone el state actual
            final state = provider.state;

            if (state is PostLoading || state is PostInitial) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.neonGreen),
              );
            }

            if (state is PostError) {
              return Center(
                child: Text(
                  "Error: ${state.message}",
                  style: AppTextStyles.body.copyWith(color: Colors.redAccent),
                ),
              );
            }

            if (state is PostLoaded) {
              final posts = state.posts;

              if (posts.isEmpty) {
                return Center(
                  child: Text(
                    "Aún no hay posts.",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.only(top: 30),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];
                  return PostCard(
                    id: post.id,
                    imageUrl: "assets/imgs/tatto_img.png",
                    category: post.category,
                    userName: post.userId.substring(0, 4),
                    title: post.title,
                    description: post.description,
                    tags: post.tags,
                    likes: 12,
                    comments: 18,
                  );
                },
              );
            }
            return const SizedBox.shrink();

            //          child: Padding(
            //           padding: const EdgeInsets.symmetric(horizontal: 24.0),
          },
        ),
      ),
      //     ),
    );
  }
}
