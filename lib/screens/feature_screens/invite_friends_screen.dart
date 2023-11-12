import 'package:flutter/material.dart';
import 'package:oopacks/widgets/common_widgets.dart';
import 'package:share_plus/share_plus.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);

  final String inviteLink = 'https://github.com/Muhammed-Aslam-n/oopacks_leEyet_machine_test';

  void shareInviteLink(BuildContext context) {
    Share.share('Check out this app! Join using the link: $inviteLink');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invite Friends'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const PoppinsText(data: 'OOPACKS',fontSize: 25,),
            const SizedBox(height: 60),
            const PoppinsText(
              data:
                  'Discover the joy of shopping together! Share the excitement of exclusive deals, endless choices, and unbeatable discounts with your friends. Invite them to join our shopping community and unlock amazing rewards for both you and your friends. With a plethora of options and fantastic savings, together, we can redefine the shopping experience. Start the trend and spread the joy of shopping with friends today!',
              fontSize: 18,
            ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                shareInviteLink(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white,
                fixedSize: const Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              child: const Text('Share Invite Link'),
            ),
          ],
        ),
      ),
    );
  }
}
