import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/userServices.dart';
import 'package:user_profile_management_app/ui/screens/addUserScreen/addUserScreen.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/app_bar.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/fab.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/user_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _dataLoding = true;
  List<UserModel> users = [];

  static final _skeletonizerFakeData = UserModel(
    id: 1,
    name: 'user name',
    email: 'useremail@gmail.com',
  );

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  Future<void> getUsers() async {
    users = await UserServices().getUsers();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _dataLoding = false;
      });
    });
  }

  void _loadCachedData() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kWhite,
      appBar: CustomAppBar(),
      body: _body(),
      floatingActionButton: CustomFab(onPress: () => _createUser()),
    );
  }

  Widget _body() {
    return Skeletonizer(
      enabled: _dataLoding,
      child: ListView.builder(
        padding: EdgeInsets.all(8.r),
        itemCount: _dataLoding ? 10 : users.length,
        itemBuilder: (BuildContext context, int index) {
          return _dataLoding
              ? UserItem(user: _skeletonizerFakeData)
              : UserItem(user: users[index]);
        },
      ),
    );
  }

  void _createUser() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (route) => AddUserScreen()));
  }
}
