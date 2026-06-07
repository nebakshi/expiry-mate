import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/responsive.dart';

const _pageIcons = [
  Icons.qr_code_scanner_rounded,
  Icons.document_scanner_outlined,
  Icons.notifications_active_outlined,
  Icons.eco_rounded,
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _index = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    await markOnboardingSeen();
    ref.read(onboardingSeenProvider.notifier).state = true;
    if (mounted) context.go('/login');
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final titles = [l.onboardingTitle1, l.onboardingTitle2, l.onboardingTitle3, l.onboardingTitle4];
    final bodies = [l.onboardingBody1, l.onboardingBody2, l.onboardingBody3, l.onboardingBody4];
    final isLast = _index == _pageIcons.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: _finish,
                child: Text(l.skip),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _pageIcons.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) {
                  final iconSize = Responsive.isSmallDevice ? 48.0 : 72.0;
                  final iconPad = Responsive.isSmallDevice ? 18.0 : 28.0;
                  return Padding(
                    padding: EdgeInsets.all(Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(iconPad),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.10),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(_pageIcons[i],
                              size: iconSize, color: AppColors.primary),
                        ),
                        SizedBox(height: Responsive.isSmallDevice ? AppSpacing.md : AppSpacing.xl),
                        Text(titles[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Responsive.fontSize(22),
                                fontWeight: FontWeight.w800)),
                        const SizedBox(height: AppSpacing.md),
                        Text(bodies[i],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: Responsive.fontSize(15),
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                                height: 1.4)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_pageIcons.length, (i) {
                final active = i == _index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: active ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: active
                        ? AppColors.primary
                        : AppColors.primary.withValues(alpha: 0.25),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: FilledButton(
                onPressed: () {
                  if (isLast) {
                    _finish();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                    );
                  }
                },
                child: Text(isLast ? l.getStarted : l.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
