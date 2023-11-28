import 'package:mortgage/app_router.dart';
import 'package:mortgage/screens/v_screen/widgets/first_board_body.dart';
import 'package:mortgage/screens/v_screen/widgets/second_board_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  late final SharedPreferences _sh;
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    _sh = context.read<SharedPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _controller,
          children: [
            FirstBoardBody(
              onTap: () => _controller.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.linear,
              ),
            ),
            SecondBoardBody(
              onTap: () async {
                await _sh.setBool('boarding_done', true);
                context.go(AppRouter.mortgage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
