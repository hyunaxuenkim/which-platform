import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/app_language.dart';
import '../domain/app_language_extensions.dart';
import '../domain/app_strings.dart';
import '../providers/app_language_providers.dart';

Future<AppLanguage?> showAppSettingsSheet(
  BuildContext context, {
  AppLanguage initialLanguage = AppLanguage.en,
}) {
  return showModalBottomSheet<AppLanguage>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: Colors.transparent,
    builder: (context) => AppSettingsSheet(initialLanguage: initialLanguage),
  );
}

class AppSettingsSheet extends ConsumerStatefulWidget {
  const AppSettingsSheet({super.key, this.initialLanguage = AppLanguage.en});

  final AppLanguage initialLanguage;

  @override
  ConsumerState<AppSettingsSheet> createState() => _AppSettingsSheetState();
}

class _AppSettingsSheetState extends ConsumerState<AppSettingsSheet> {
  late AppLanguage _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _selectedLanguage = widget.initialLanguage;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final AppStrings strings = ref.watch(appStringsProvider);
    final AppLanguage currentLanguage = ref.watch(appLanguageProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FA),
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1A000000),
              blurRadius: 30,
              offset: Offset(0, 12),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 44,
                  height: 5,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD3D7DA),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      strings.settingsTitle,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: -1.1,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF595C5D),
                    ),
                    icon: const Icon(Icons.close_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                strings.settingsSectionGeneral,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: const Color(0xFF5C5B5B),
                  fontWeight: FontWeight.w800,
                  letterSpacing: currentLanguage.isCjk ? 0 : 1.8,
                ),
              ),
              const SizedBox(height: 10),
              _SettingsEntryCard(
                icon: Icons.translate_rounded,
                title: strings.settingsLanguageLabel,
                description: strings.settingsLanguageDescription,
                child: Column(
                  children: AppLanguage.values
                      .map(
                        (language) => Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: _LanguageOptionTile(
                            language: language,
                            selected: language == _selectedLanguage,
                            title: _titleFor(language, strings),
                            subtitle: language.endonym,
                            onTap: () {
                              ref
                                  .read(appLanguageProvider.notifier)
                                  .setLanguage(language);
                              setState(() {
                                _selectedLanguage = language;
                              });
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).pop(_selectedLanguage),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF0049E6),
                    foregroundColor: const Color(0xFFF2F1FF),
                    padding: const EdgeInsets.symmetric(vertical: 18),
                  ),
                  child: Text(strings.settingsClose),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SettingsEntryCard extends StatelessWidget {
  const _SettingsEntryCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.child,
  });

  final IconData icon;
  final String title;
  final String description;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0x140049E6),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: const Color(0xFF0049E6)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: const Color(0xFF595C5D),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }
}

class _LanguageOptionTile extends StatelessWidget {
  const _LanguageOptionTile({
    required this.language,
    required this.selected,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final AppLanguage language;
  final bool selected;
  final VoidCallback onTap;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Ink(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: selected ? const Color(0x120049E6) : const Color(0xFFF4F6F7),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? const Color(0xFF0049E6) : const Color(0xFFE2E5E7),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const Color(0xFF595C5D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            AnimatedContainer(
              duration: const Duration(milliseconds: 160),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: selected ? const Color(0xFF0049E6) : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? const Color(0xFF0049E6)
                      : const Color(0xFFB8BCBE),
                  width: 2,
                ),
              ),
              child: selected
                  ? const Icon(
                      Icons.check_rounded,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

String _titleFor(AppLanguage language, AppStrings strings) {
  switch (language) {
    case AppLanguage.en:
      return strings.settingsLanguageOptionEn;
    case AppLanguage.zhHans:
      return strings.settingsLanguageOptionZhHans;
    case AppLanguage.ja:
      return strings.settingsLanguageOptionJa;
  }
}
