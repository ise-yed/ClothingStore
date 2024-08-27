import 'package:clothingstore/components/colors.dart';
import 'package:clothingstore/components/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            AppStrings.userInfo,
            style: textTheme.bodyLarge,
          ),
        ),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            const CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.kGray100,
              child: Icon(
                Icons.person_add_alt_1_rounded,
                size: 25,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              AppStrings.buttonNavigationBasketLabel,
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              "09376993662",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 50,
              child: ListTile(
                leading: const Icon(Icons.message_outlined),
                onTap: () {},
                trailing: const Icon(Icons.arrow_back_ios_rounded),
                title: Text(
                  AppStrings.myComment,
                  style: textTheme.bodyMedium,
                ),
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.festival_outlined),
              onTap: () {},
              trailing: const Icon(Icons.arrow_back_ios_rounded),
              title: Text(
                AppStrings.myComment,
                style: textTheme.bodyMedium,
              ),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.payment_rounded),
              onTap: () {},
              trailing: const Icon(Icons.arrow_back_ios_rounded),
              title: Text(
                AppStrings.myComment,
                style: textTheme.bodyMedium,
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
