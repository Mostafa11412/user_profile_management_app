import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/user_services.dart';
import 'package:user_profile_management_app/ui/common_widgets/textField.dart';
import 'package:user_profile_management_app/ui/common_widgets/custom_button.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/home_screen.dart';
import 'package:user_profile_management_app/ui/common_widgets/app_bar.dart';

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
        // Form to add new user
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Add name field
                child: CustomTextField(
                  label: "Name",
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Add username field
                child: CustomTextField(
                  label: "Username",
                  controller: _usernameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Add email field
                child: CustomTextField(
                  label: "Email",
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Add email field
                child: CustomTextField(
                  label: "Phone",
                  controller: _phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                // Add website field
                child: CustomTextField(
                  label: "Website",
                  controller: _websiteController,
                ),
              ),
              SizedBox(height: 36.h),
              // Button to save the new user
              Center(
                child: CustomButton(
                  colorSide: kWhite,
                  // onPressed action
                  onPressed: () => _addUser(),
                  icon: Icons.add_task_sharp,
                  color: kGreen,
                  title: "Save",
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _addUser() async {
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
      // call adduser to post new user
      await UserServices().addUser(newUser).then((value) => _dialog());
    }
  }

// Show successfully dialog affter press save
  Future _dialog() {
    return showDialog(
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                  (route) => false,
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

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _usernameController.dispose();
  }
}
