import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SildesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SildesInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SildesInfo>[
  SildesInfo(title: 'Busca tu comida', caption: 'Nulla sit irure non nulla irure magna.', imageUrl: 'assets/images/1.png'),
  SildesInfo(title: 'Entrega rápida', caption: 'Occaecat aliquip quis cillum irure in fugiat dolore adipisicing.', imageUrl: 'assets/images/2.png'),
  SildesInfo(title: 'Disfruta tu comida', caption: 'Consectetur officia proident ad excepteur nisi consequat proident.', imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() => endReached = true);
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((slide) => _Slide(title: slide.title, caption: slide.caption, imageUrl: slide.imageUrl)).toList(),
          ),

          Positioned(
            right: 20,
            top: 50,
            child: TextButton(child: const Text('Skip'), onPressed: () => Navigator.pop(context)),
          ),

          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 400),
                    child: FilledButton(child: const Text('Comenzar'), onPressed: () => Navigator.pop(context)),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
