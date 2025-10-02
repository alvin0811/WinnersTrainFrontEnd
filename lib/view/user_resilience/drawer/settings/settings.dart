
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/utils/extensions/custom_inkwell.dart';

import 'package:winner_trains_app/view/user_resilience/drawer/settings/delete_account_dialog.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/widgets/settings_widget.dart';
// import 'package:winner_trains_app/view/user_resilience/others/delete_account_dialog.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class Settings extends StatelessWidget {
  Settings({super.key});
  final ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const CustomAppBar(title: 'Settings'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionHeader(context, AppAssets.icon.personSettings, 'Account'),
            15.h.verticalSpace,
            settingsCard([
              SettingsWidget(
                imagePath: AppAssets.icon.lockSettings,
                text: 'Change Password',
                iconPath: AppAssets.icon.forwardSettings,
              ).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.changePassword)),
              SettingsWidget(
                imagePath: AppAssets.icon.deleteSettings,
                text: 'Delete Account',
                iconPath: AppAssets.icon.forwardSettings,
              ).inkWell(onTap: () => deleteAccountDialog(context)),
            ]),
            15.h.verticalSpace,
            sectionHeader(
                context, AppAssets.icon.notificationsSettings, 'Notifications'),
            15.h.verticalSpace,
            settingsCard([
              SettingsWidget(
                imagePath: AppAssets.icon.notificationsSettings,
                text: 'Push Notifications',
                isToggleSwitch: true,
                isSelected: isSelected,
              )
            ], verticalPadding: 10.0),
            15.h.verticalSpace,
            sectionHeader(context, AppAssets.icon.moreSettings, 'More'),
            15.h.verticalSpace,
            settingsCard([
              SettingsWidget(
                imagePath: AppAssets.icon.termsSettings,
                text: 'Terms & Conditions',
                iconPath: AppAssets.icon.forwardSettings,
              ).inkWell(
                  onTap: () => Navigator.pushNamed(
                      context, RoutesName.termsAndConditions)),
              SettingsWidget(
                imagePath: AppAssets.icon.privacySettings,
                text: 'Privacy Policy',
                iconPath: AppAssets.icon.forwardSettings,
              ).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.privacyPolicy)),
              SettingsWidget(
                imagePath: AppAssets.icon.aboutSettings,
                text: 'About App',
                iconPath: AppAssets.icon.forwardSettings,
              ).inkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RoutesName.aboutApp)),
            ]),
          ],
        ).paddingSymmetric(horizontal: 20.w, vertical: 20.h),
      ),
    );
  }
}
