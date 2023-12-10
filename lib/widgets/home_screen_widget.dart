import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oopacks/screens/authentication_screens/login_screen.dart';
import 'package:oopacks/utils/shared_preference_helper.dart';

import '../screens/feature_screens/about_screen.dart';
import '../screens/feature_screens/invite_friends_screen.dart';
import '../screens/feature_screens/settings_screen.dart';
import 'common_widgets.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight;
  final String? title;

  const HomeAppBar({Key? key, required this.appBarHeight, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      titleSpacing: 100,
      title: title != null ? PoppinsText(data: title ?? '') : null,
      actions: [
        IconButton(
          onPressed: ()async {
            debugPrint('LoggingOut');
            final logout = await SharedPreferenceHelper.clearUserLoggedIn();
            if(logout == true) {
              Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (builder) => const LoginScreen()), (
                    route) => false);
            }

          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ],
      flexibleSpace: title == null
          ? const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 40),
          child: GreetingScreen(),
        ),
      )
          : null,
      shape: title == null
          ? const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      )
          : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBarHeight);
}

class GreetingScreen extends StatefulWidget {
  const GreetingScreen({super.key});

  @override
  _GreetingScreenState createState() => _GreetingScreenState();
}

class _GreetingScreenState extends State<GreetingScreen> {
  final List<String> greetings = ['Hi 👋', '', ''];
  final StreamController<String> _greetingStreamController =
  StreamController<String>();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startGreetingStream();
  }

  String getGreeting() {
    final hour = DateTime
        .now()
        .hour;
    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  void _startGreetingStream() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentIndex < greetings.length) {
        if (currentIndex == 1) {
          _greetingStreamController.add(getGreeting());
        } else {
          _greetingStreamController.add(greetings[currentIndex]);
        }
        currentIndex++;
      } else {
        timer.cancel();
        _greetingStreamController
            .addError('assets/launch_icons/oopacks_launch_icon.png');
        // _greetingStreamController.close();
      }
    });
  }

  @override
  void dispose() {
    _greetingStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<String>(
      stream: _greetingStreamController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PoppinsText(
            data: snapshot.data!,
            fontSize: 22,
            color: Theme
                .of(context)
                .colorScheme
                .tertiary,
          );
        } else if (snapshot.hasError) {
          return Wrap(
            children: [
              Image.asset(
                'assets/launch_icons/oopacks_launch_icon.png',
                height: 35,
                width: 25,
                color: Theme
                    .of(context)
                    .colorScheme
                    .tertiary,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'OOPACKS',
                  style: GoogleFonts.aBeeZee(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .tertiary,
                      fontSize: 24),
                ),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final List<String> drawerItemList = [
    'Home',
    'Invite Friends',
    'Settings',
    'About'
  ];

  final List<String> drawerImages = [
    'assets/icons/home.png',
    'assets/icons/invitation.png',
    'assets/icons/settings.png',
    'assets/icons/info.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.12,
            decoration:
            BoxDecoration(color: Theme
                .of(context)
                .colorScheme
                .tertiary),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  runSpacing: 0,
                  spacing: 0,
                  children: [
                    Image.asset(
                      'assets/launch_icons/oopacks_launch_icon.png',
                      height: 35,
                      width: 25,
                      color: Theme
                          .of(context)
                          .colorScheme
                          .primary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'OOPACKS',
                        style: GoogleFonts.aBeeZee(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  'Shop the Best',
                  style: GoogleFonts.abel(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          for (var drawerIndex = 0;
          drawerIndex < drawerItemList.length;
          drawerIndex++)
            DrawerItemWidget(
              onTap: () => changeThePage(drawerIndex, context),
              leadingItemUrl: drawerImages[drawerIndex],
              titleText: drawerItemList[drawerIndex],
              index: drawerIndex,
            ),
          const Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: PoppinsText(
                  data: 'All Right Reserved ©',
                  fontSize: 11,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  changeThePage(index, BuildContext context) {
    switch (index) {
      case 0:
        Scaffold.of(context).closeDrawer();
        break;
      case 1:
        Scaffold.of(context).closeDrawer();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => const InviteFriendsScreen()));
        break;
      case 2:
        Scaffold.of(context).closeDrawer();
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const SettingsScreen()));
        break;
      case 3:
        Scaffold.of(context).closeDrawer();
        Navigator.push(context,
            MaterialPageRoute(builder: (builder) => const AboutScreen()));
        break;
    }
  }
}

class DrawerItemWidget extends StatelessWidget {
  final Function()? onTap;
  final String? leadingItemUrl;
  final String? titleText;
  final int index;

  const DrawerItemWidget({
    Key? key,
    this.onTap,
    this.leadingItemUrl,
    this.titleText,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // tileColor: Theme.of(context).col,
        leading: AspectRatio(
            aspectRatio: index == 2
                ? 0.5 / 1.68
                : index == 4
                ? 0.5 / 1.2
                : 0.5 / 1.5,
            child: Image.asset(
              leadingItemUrl ?? '',
              height: 30,
              width: 30,
              color: Theme
                  .of(context)
                  .colorScheme.primary,
            )),
        title: PoppinsText(
          data: titleText ?? '',
          color: Theme
              .of(context)
              .colorScheme.secondary,
        ),
      ),
    );
  }
}
