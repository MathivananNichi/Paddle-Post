import 'package:flutter/material.dart';
import 'package:paddle_post/core/core.dart';
import 'package:paddle_post/features/home/presentation/widgets/widgets.dart';

/// Home screen for PaddlePost companion app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSoundOn = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          left: AppPadding.p16,
          right: AppPadding.p20,
          bottom: AppPadding.p20,
        ),
        child: Column(
          spacing: AppSize.s16,
          children: [
            HomeTopBar(
              isSoundOn: _isSoundOn,
              onSoundToggle: () {
                setState(() {
                  _isSoundOn = !_isSoundOn;
                });
              },
            ),
            const Expanded(
              child: Row(
                spacing: AppSize.s16,
                children: [
                  Expanded(flex: 3, child: GameDashBoard()),
                  Expanded(
                    flex: 2,
                    child: Column(
                      spacing: AppSize.s16,
                      children: [
                        Expanded(child: CustomGameCard()),
                        Expanded(
                          child: SizedBox(width: double.infinity, child: LastMatchCard()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
