import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:poc/providers/dialog_provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/locale_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);
    final appLocalizations = AppLocalizations.of(context);
    final dialogService = ref.read(dialogServiceProvider);

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
                final result = await dialogService.showDialog(
                  title: 'Enter Your Name',
                  description: 'Please confirm your name',
                  buttonTitle: 'Confirm',
                );

                if (result.confirmed) {
                  print('User entered: $result');
                } else {
                  print('User canceled the dialog.');
                }
              },
              child: const Text('Show Dialog'),
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
