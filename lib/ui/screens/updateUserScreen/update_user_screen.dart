import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/user_services.dart';
import 'package:user_profile_management_app/ui/common_widgets/textField.dart';
import 'package:user_profile_management_app/ui/common_widgets/custom_button.dart';
import 'package:user_profile_management_app/ui/common_widgets/app_bar.dart';

class UpdateUserScreen extends StatefulWidget {
  final UserModel user;
  const UpdateUserScreen({super.key, required this.user});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _websiteController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name!;
    _emailController.text = widget.user.email!;
    _phoneController.text = widget.user.phone!;
    _websiteController.text = widget.user.website!;
    _usernameController.text = widget.user.username!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Edit User'),
      body: _body(),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            CustomTextField(
              labelText: 'name',
              iconType: "person",
              controller: _nameController,
              type: "name",
            ), //
            CustomTextField(
              labelText: 'username',
              iconType: "username",
              controller: _usernameController,
              type: "username",
            ), //
            CustomTextField(
              labelText: 'email',
              iconType: "email",
              controller: _emailController,
              type: "email",
            ), //
            CustomTextField(
              labelText: 'phone',
              iconType: "phone",
              controller: _phoneController,
              type: "phone",
            ), //
            CustomTextField(
              labelText: 'website',
              iconType: "website",
              controller: _websiteController,
              type: "website",
            ),
            SizedBox(height: 36.h),
            Center(
              child: CustomButton(
                onPressed: () => _updateUser(),
                title: 'Update',
                color: kGreen,
                colorSide: kWhite,
                icon: Icons.add_task_sharp,
              ),
            )
          ],
        ),
      ),
    );
  }

  void _updateUser() async {
    if (_formKey.currentState!.validate()) {
      widget.user.name = _nameController.text;
      widget.user.username = _usernameController.text;
      widget.user.email = _emailController.text;
      widget.user.phone = _phoneController.text;
      widget.user.website = _websiteController.text;

      await UserServices().editUser(widget.user).then(
            (value) => _showSnackbar('User Updated'),
            onError: (error) => _showSnackbar(error),
          );
    }
  }

  void _showSnackbar(String txt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(txt),
      ),
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
