import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:user_profile_management_app/core/colors/colors.dart';
import 'package:user_profile_management_app/data/user_model.dart';
import 'package:user_profile_management_app/serviceController/shared_pref_controller.dart';
import 'package:user_profile_management_app/ui/common_widgets/custom_button.dart';
import 'package:user_profile_management_app/ui/screens/addUserScreen/addUserScreen.dart';
import 'package:user_profile_management_app/ui/common_widgets/app_bar.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/fab.dart';
import 'package:user_profile_management_app/ui/screens/homeScreen/widgets/user_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _dataLoading = true;
  List<UserModel> users = [];
  bool _loadOffline = false;
  bool _isOnline = true;

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
        _dataLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Users',
        showBackButton: false,
        showThemeIcon: true,
        isCenterTitle: false,
      ),
      body: _body(),
      floatingActionButton: CustomFab(onPress: () => _createUser()),
    );
  }

  Widget _body() {
    return OfflineBuilder(
      connectivityBuilder: (context, value, child) {
        final bool connected = !value.contains(ConnectivityResult.none);
        _isOnline = connected;
        if (connected) {
          debugPrint('=====\nONLINE\n=====');
          _loadOffline = false;
          return _dataWidget();
        } //
        else {
          debugPrint('=====\nOFFLINE\n=====');
          return _loadOffline ? _dataWidget() : _offlineWidget(context);
        }
      },
      child: const SizedBox(),
    );
  }

  Widget _dataWidget() {
    return Skeletonizer(
      enabled: _dataLoading,
      child: (!_dataLoading && users.isEmpty)
          ? Center(child: Text('No Data Found'))
          : ListView.builder(
              padding: EdgeInsets.all(8.r),
              itemCount: _dataLoading ? 10 : users.length,
              itemBuilder: (BuildContext context, int index) {
                return _dataLoading
                    ? UserItem(user: _skeletonizerFakeData, isOnline: _isOnline)
                    : UserItem(user: users[index], isOnline: _isOnline);
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
          Text(
            'It Looks Like You\'re Offline!\nYou Can Explore The Saved Data,\nBut You Can\'t Create, Delete or Update.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 0.05.sh),
          CustomButton(
            title: 'Load Saved Data',
            onPressed: () => _loadSavedData(),
            color: kGreen,
            colorSide: kWhite,
            icon: Icons.replay_rounded,
          ),
        ],
      ),
    );
  }

  void _loadSavedData() {
    setState(() {
      _loadOffline = true;
    });
  }

  void _createUser() {
    _isOnline
        ? Navigator.of(context).push(
            MaterialPageRoute(builder: (route) => AddUserScreen()),
          )
        : ScaffoldMessenger.of(context).showSnackBar(_snackBar());
  }

  SnackBar _snackBar() {
    return SnackBar(
      content: Text('You\'r Offline'),
    );
  }
}
