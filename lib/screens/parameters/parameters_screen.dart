import 'package:mortgage/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:mortgage/screens/parameters/param_item.dart';

class ParametersScreen extends StatelessWidget {
  const ParametersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Ajustes',
                  style: TextStyle(
                    color: Color(0xFF363636),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ParamItem(
                title: 'Política de privacidad',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra:
                      'https://docs.google.com/document/d/1HxulcD1gNQm0XXmUVFzk-_CAdDlofzbJE9IcXswHt1o/edit?usp=sharing',
                ),
              ),
              ParamItem(
                title: 'Términos y Condiciones',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra:
                      'https://docs.google.com/document/d/14H1luNmj23rQ3jyUepgO_lP_rJh8FoTqkszm_4l5Wp0/edit?usp=sharing',
                ),
              ),
              ParamItem(
                title: 'Soporte de escritura',
                onTap: () => context.push(
                  AppRouter.ppu,
                  extra: 'https://forms.gle/TZyM8YxcZRUybk3v8',
                ),
              ),
              ParamItem(
                title: 'Califica nuestra aplicación en la AppStore',
                onTap: () => InAppReview.instance.openStoreListing(
                  appStoreId: '6473281759',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
