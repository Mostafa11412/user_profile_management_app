import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';

import 'package:user_profile_management_app/ui/screens/detailsScreen/widgets/confirmation_dialog.dart';
import 'package:user_profile_management_app/ui/common_widgets/custom_button.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/widgets/details_tile.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/widgets/info_section.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/widgets/user_avatar.dart';

import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/ui/screens/updateUserScreen/update_user_screen.dart';

class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  final bool isOnline;

  const UserDetailScreen({Key? key, required this.user, required this.isOnline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isLightMode = AdaptiveTheme.of(context).mode.isLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Column(
        children: [
          UserAvatarSection(user: user),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoSection(
                          title: 'Basic Information',
                          icon: Icons.person_outline,
                          isLightMode: isLightMode,
                          children: [
                            DetailTile(
                              icon: Icons.account_circle_outlined,
                              label: 'Username',
                              value: user.username ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.phone_outlined,
                              label: 'Phone',
                              value: user.phone ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.language_outlined,
                              label: 'Website',
                              value: user.website ?? 'N/A',
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        InfoSection(
                          title: 'Address',
                          icon: Icons.location_on_outlined,
                          isLightMode: isLightMode,
                          children: [
                            DetailTile(
                              icon: Icons.home_outlined,
                              label: 'Street',
                              value:
                                  '${user.address?.street ?? 'N/A'}, ${user.address?.suite ?? ''}',
                            ),
                            DetailTile(
                              icon: Icons.location_city_outlined,
                              label: 'City',
                              value: user.address?.city ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.pin_drop_outlined,
                              label: 'Zipcode',
                              value: user.address?.zipcode ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.explore_outlined,
                              label: 'Coordinates',
                              value:
                                  'Lat: ${user.address?.geo?.lat ?? 'N/A'}\nLng: ${user.address?.geo?.lng ?? 'N/A'}',
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        InfoSection(
                          title: 'Company',
                          icon: Icons.business_outlined,
                          isLightMode: isLightMode,
                          children: [
                            DetailTile(
                              icon: Icons.business_center_outlined,
                              label: 'Name',
                              value: user.company?.name ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.catching_pokemon_outlined,
                              label: 'Catch Phrase',
                              value: user.company?.catchPhrase ?? 'N/A',
                            ),
                            DetailTile(
                              icon: Icons.work_outline,
                              label: 'BS',
                              value: user.company?.bs ?? 'N/A',
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButton(
                                onPressed: () => isOnline
                                    ? showDialog(
                                        context: context,
                                        builder: (_) =>
                                            DeleteConfirmationDialog(
                                          user: user,
                                          isLightMode: isLightMode,
                                        ),
                                      )
                                    : ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                        content: Text('You\'r Offline'),
                                      )),
                                // isLightMode: isLightMode,
                                title: 'Delete User',
                                
                                color: isLightMode ? kGreen : kGreen,
                                colorSide:
                                    isLightMode ? Colors.white : Colors.white,
                                icon: Icons.delete_rounded,
                                // width: double.infinity, // Full width for Expanded
                              ),
                            ),
                            SizedBox(
                              width: 10.w, // Space between buttons
                            ),
                            Expanded(
                              child: CustomButton(
                                onPressed: () {
                                  isOnline
                                      ? Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (route) =>
                                                UpdateUserScreen(user: user),
                                          ),
                                        )
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                          content: Text('You\'r Offline'),
                                        ));
                                },
                                // isLightMode: isLightMode,
                                title: 'Update User',
                                icon: Icons.edit_rounded,
                                color: kGreen ,
                                colorSide: isLightMode ? Colors.white : kGreen,
                                // width: double.infinity, // Full width for Expanded
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
