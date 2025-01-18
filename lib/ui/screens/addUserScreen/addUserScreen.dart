import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/userServices.dart';
import 'package:user_profile_management_app/ui/screens/addUserScreen/widgets/textField.dart';
import 'package:user_profile_management_app/ui/screens/detailsScreen/widgets/delete_button.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/homeScreen.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/app_bar.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bool isLightMode = AdaptiveTheme.of(context).mode.isLight;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "Add User",
        showBackButton: true,
        showThemeIcon: false,
        isCenterTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 16.h,
        ),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    labelText: "Name",
                    iconType: "person",
                    controller: _nameController,
                    type: "name"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    labelText: "Username",
                    iconType: "username",
                    controller: _usernameController,
                    type: "username"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    labelText: "Email",
                    iconType: "email",
                    controller: _emailController,
                    type: "email"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    labelText: "Phone",
                    iconType: "phone",
                    controller: _phoneController,
                    type: "phone"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                    labelText: "Website",
                    iconType: "website",
                    controller: _websiteController,
                    type: "website"),
              ),
              SizedBox(height: 36.h),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Retrieve the actual text values from the controllers
                      String name = _nameController.text;
                      String email = _emailController.text;
                      String phone = _phoneController.text;
                      String website = _websiteController.text;
                      String username = _usernameController.text;
                      // Create a UserModel with the retrieved text values
                      UserModel newUser = UserModel(
                        name: name,
                        username: username,
                        email: email,
                        phone: phone,
                        website: website,
                      );

                      // Call the addUser method
                      await UserServices().addUser(newUser);

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            title: Row(
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                SizedBox(width: 10.0),
                                Text("Done"),
                              ],
                            ),
                            content: Text(
                              "User added successfully!",
                              style: TextStyle(fontSize: 16.0),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.green),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  icon: Icons.add_task_sharp,
                  color: kGreen,
                  isLightMode: isLightMode,
                  title: "Save",
                  width: 15.w,
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
