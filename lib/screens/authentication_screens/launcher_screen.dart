import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oopacks/screens/feature_screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../../providers/launch_provider/launch_provider.dart';
import '../../utils/route_transition.dart';
import 'login_screen.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  _LaunchScreenState createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  double _opacity = 0.0;
  final double _logoRotation = 0.0;

  @override
  void initState() {
    // Start the animation after a short delay
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    // Future.delayed(
    //     const Duration(seconds: 3),
    //     () => Navigator.pushReplacement(
    //           context,
    //           MaterialPageRoute(builder: (context) => const HomeScreen()),
    //         ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureProvider(
        create: (_) {
          final LaunchProvider authProvider = LaunchProvider();
          return authProvider.checkUserLoggedIn();
        },
        initialData: null,
        child: Consumer<LaunchProvider>(
          builder: (context, authProvider, _) {
            if (mounted) {
              Future.delayed(
                const Duration(seconds: 3),
              ).then(
                (value) => Navigator.pushAndRemoveUntil(
                  context,
                  // authProvider.isLoggedIn
                  //     ?
                  CustomPageRoute(page: const HomeScreen()),
                      // : CustomPageRoute(page: const LoginScreen()),
            ModalRoute.withName('/')
                ),
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(begin: -0.1, end: 0.0),
                    duration: const Duration(milliseconds: 2500),
                    builder: (context, value, child) {
                      return Transform.rotate(
                        angle: value + _logoRotation,
                        child: Image.asset(
                          'assets/launch_icons/oopacks_launch_icon.png',
                          height: 50,
                          width: 50,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      );
                    },
                  ),
                  AnimatedOpacity(
                    duration: const Duration(seconds: 1),
                    opacity: _opacity,
                    child: Text(
                      'OOPACKS',
                      style: GoogleFonts.aBeeZee(
                          color: Theme.of(context).colorScheme.tertiary,
                          fontSize: 24),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
