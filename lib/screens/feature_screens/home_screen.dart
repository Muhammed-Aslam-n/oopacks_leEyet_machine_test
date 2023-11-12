import 'package:flutter/material.dart';
import 'package:oopacks/widgets/common_widgets.dart';

import '../../widgets/home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(
          appBarHeight: size.height * 0.12,
        ),
        drawer: const DrawerWidget(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.25,
            ),
            Center(
              child: PoppinsText(data: 'You have Successfully Logged In',color: Theme.of(context).colorScheme.secondary,),
            ),
          ],
        ),
      ),
    );
  }
}
