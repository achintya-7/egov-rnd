import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_tracker_app/util/i18n_translations.dart';

import '../../data/token_service.dart';
import '../../router/routes.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = DigitTheme.instance;
    final textTheme = theme.mobileTheme.textTheme;

    return Drawer(
      child: ScrollableContent(
        header: Container(
          color: DigitTheme.instance.colors.cloudGray,
          padding: theme.buttonPadding,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: kPadding * 13),
            child: Column(
              children: [
                Text("--- Name ---", style: textTheme.displayMedium),
                Text("--- Phone ---", style: textTheme.headlineLarge),
              ],
            ),
          ),
        ),
        footer: Padding(
          padding: theme.buttonPadding,
          child: const PoweredByDigit(),
        ),
        children: [
          DigitIconTile(
            title: AppTranslation.HOME.tr,
            onPressed: () {},
            icon: Icons.home,
          ),
          DigitIconTile(
            title: AppTranslation.LANGUAGE.tr,
            onPressed: () {},
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DigitElevatedButton(child: const Text("Hindi"), onPressed: () {}),
                DigitOutLineButton(label: "English", onPressed: () {}),
              ],
            ),
            icon: Icons.language,
          ),
          DigitIconTile(
            title: AppTranslation.ORG_PROFILE.tr,
            onPressed: () {},
            icon: Icons.person,
          ),
          DigitIconTile(
            title: AppTranslation.LOGOUT.tr,
            onPressed: () async {
              await SecureStorageService.delete("token");
              Get.offAllNamed(LANG);
            },
            icon: Icons.logout,
          ),
        ],
      ),
    );
  }
}
