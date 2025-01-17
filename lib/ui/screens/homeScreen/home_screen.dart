import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/sharedPref_controller.dart';
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
    users = await SharedPrefrenceController.getUsers();
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _dataLoding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Users',
      ),
      body: OfflineBuilder(
        connectivityBuilder: (context, value, child) {
          final bool connected = !value.contains(ConnectivityResult.none);
          if (connected) {
            // isOnline = true;
            // showOfflineWidget = true;
            // BlocProvider.of<UsersCubit>(context).getUsers();
            return _body();
          } //
          else {
            return _offlineWidget(context);
          }
        },
        child: const SizedBox(),
      ),
      floatingActionButton: CustomFab(onPress: () => _createUser()),
    );
  }

  Widget _body() {
    return Skeletonizer(
      enabled: _dataLoding,
      child: (!_dataLoding && users.isEmpty)
          ? Center(child: Text('No Data Found'))
          : ListView.builder(
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

  Widget _offlineWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/offline.gif',
            height: 0.1.sh,
          ),
          SizedBox(height: 0.05.sh),
          const Text('Looks Like You\'re Offline!'),
          SizedBox(height: 0.05.sh),
        ],
      ),
    );
  }

  void _createUser() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (route) => AddUserScreen()),
    );
  }
}
