import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mortgage/app_router.dart';
import 'package:mortgage/screens/v_screen/widgets/on_board_screen.dart';
import 'package:mortgage/screens/v_screen/widgets/newer_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mortgage/widgets/app_button.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VScreen extends StatefulWidget {
  const VScreen({super.key});

  @override
  State<VScreen> createState() => _VScreenState();
}

class _VScreenState extends State<VScreen> {
  late final SharedPreferences _shPref;
  bool _pageInited = false;
  bool khl = false;
  String mNews = '';

  @override
  void initState() {
    super.initState();

    _shPref = context.read<SharedPreferences>();
    _pr();
  }

  void _pr() async {
    rating(_shPref);

    final news = FirebaseRemoteConfig.instance.getString('prem');
    if (!news.contains('isPrem')) {
      setState(() {
        mNews = news;
        khl = true;
      });
      return;
    }

    final onBoarding = _shPref.getBool('boarding_done') ?? false;

    if (!onBoarding) {
      setState(() {
        _pageInited = true;
      });
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(AppRouter.mortgage);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (khl) return NewerScreen(n: mNews);
    return _pageInited
        ? const OnBoardScreen()
        : Scaffold(
            body: Center(
              child: Image.asset(
                'icons/intro.png',
                height: 120,
                width: 120,
              ),
            ),
          );
  }
}
