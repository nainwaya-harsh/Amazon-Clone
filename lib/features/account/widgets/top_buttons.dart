import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  final AccountServices _accountServices = AccountServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              title: 'Account',
              ontap: () {},
            ),
            AccountButton(
              title: 'Turn on seller',
              ontap: () {},
            ),
          ],
        ),
        Row(
          children: [
            AccountButton(
              title: 'Logout',
              ontap: () {
                _accountServices.logOut(context);
              },
            ),
            AccountButton(
              title: 'Your Wish list',
              ontap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
