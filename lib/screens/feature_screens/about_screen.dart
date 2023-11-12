import 'package:flutter/material.dart';

import '../../widgets/common_widgets.dart';
import '../../widgets/home_screen_widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SizedBox sizedBox = SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
    );
    return Scaffold(
      appBar: const HomeAppBar(
        appBarHeight: 60,
        title: 'About',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sizedBox,
            sizedBox,
            const PoppinsText(
              data:
                  "OOPACKS is your go-to shopping destination, offering a seamless experience for the latest\n trends in fashion, electronics, home decor, and more. Our user-friendly platform provides a wide\n array of high-quality products at affordable prices. With a commitment to customer satisfaction, we strive\n to deliver convenience through a secure shopping environment and swift delivery services. Embrace an enjoyable and hassle-free shopping journey, accompanied by exclusive deals and personalized recommendations. Join us in exploring a world of endless possibilities and unparalleled convenience. At OOPACKS, we're dedicated to elevating your shopping experience to the next level.",
              fontSize: 17,
            ),
            sizedBox,
            const PoppinsText(
              data:
                  'Thank you for choosing OOPACKS. We hope it serves your needs and respects your privacy.',
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
