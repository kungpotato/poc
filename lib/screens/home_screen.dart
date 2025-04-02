import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/enum/overlay_type.dart';
import 'package:poc/l10n/app_localizations.dart';
import 'package:poc/overlay/models/bottomsheet_model.dart';
import 'package:poc/overlay/models/dialog_model.dart';
import 'package:poc/overlay/models/snackbar_model.dart';
import 'package:poc/providers/dialog_provider.dart';
import 'package:poc/providers/locale_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final appLocalizations = AppLocalizations.of(context);
    final overlayService = ref.read(overlayProvider);

    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.hello)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              appLocalizations.welcome,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            DropdownButton<Locale>(
              value: locale,
              items: const [
                DropdownMenuItem(value: Locale('en'), child: Text('English')),
                DropdownMenuItem(value: Locale('th'), child: Text('ไทย')),
              ],
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  changeLocale(ref, newLocale);
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await overlayService.showDialog(
                  AlertRequest(
                    title: 'Session Expiring!',
                    formattedText:
                        'Your session will expire in {{1}} Click {{2}} for help.',
                    buttonTitle: 'Extend',
                    type: OverlayTypeType.danger,
                    countdownSeconds: 10,
                    // isCenterCountdown: true,
                    linkLabel: 'here',
                    linkUrl: 'https://example.com',
                  ),
                );

                if (result.confirmed) {
                  print('User entered: $result');
                } else {
                  print('User canceled the models.');
                }
              },
              child: const Text('Show Dialog'),
            ),
            ElevatedButton(
              onPressed: () async {
                final res = await overlayService.showBottomSheet(
                  BottomSheetRequest(
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('BottomSheet'),
                            ElevatedButton(
                              child: const Text('Snack'),
                              onPressed: () {
                                overlayService.showSnackBar(
                                  SnackBarRequest(
                                    title: 'xxx',
                                    type: OverlayTypeType.success,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
                print(res);
              },
              child: const Text('Show bottom sheet'),
            ),
            ElevatedButton(
              onPressed: () {
                overlayService.showSnackBar(
                  SnackBarRequest(title: 'xxx', type: OverlayTypeType.success),
                );
              },
              child: const Text('Show snack'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/second'),
              child: const Text('Go to Second Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
