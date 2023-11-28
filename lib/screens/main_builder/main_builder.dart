import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class MainBuilder extends StatelessWidget {
  const MainBuilder({super.key, required this.child});
  final StatefulNavigationShell child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: [
              NavItem(
                active: child.currentIndex == 0,
                onTap: () => _itemTap(0),
                activeIconPath: 'icons/mortgage_on.svg',
                inactiveIconPath: 'icons/mortgage_off.svg',
                text: 'Hipoteca',
              ),
              NavItem(
                active: child.currentIndex == 1,
                onTap: () => _itemTap(1),
                activeIconPath: 'icons/finance_on.svg',
                inactiveIconPath: 'icons/finance_off.svg',
                text: 'Finanzas',
              ),
              NavItem(
                active: child.currentIndex == 2,
                onTap: () => _itemTap(2),
                activeIconPath: 'icons/settings_on.svg',
                inactiveIconPath: 'icons/settings_off.svg',
                text: 'Ajustes',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _itemTap(int index) => child.goBranch(index);
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.active,
    required this.onTap,
    required this.activeIconPath,
    required this.inactiveIconPath,
    required this.text,
  });

  final bool active;
  final VoidCallback onTap;
  final String activeIconPath;
  final String inactiveIconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(active ? activeIconPath : inactiveIconPath),
            Text(
              text,
              style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: active
                    ? Theme.of(context).primaryColor
                    : const Color(0xFFC1C1C1),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
