import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/station_search_lookup.dart';
import '../providers/station_search_lookup_provider.dart';
import '../../settings/domain/app_language.dart';
import '../../settings/domain/app_language_extensions.dart';
import '../../settings/domain/app_strings.dart';
import '../../settings/providers/app_language_providers.dart';
import '../../settings/presentation/app_settings_sheet.dart';
import 'search_route_params.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  late final TextEditingController _originController;
  late final TextEditingController _destinationController;
  late final FocusNode _originFocusNode;
  late final FocusNode _destinationFocusNode;
  _SearchField? _activeField;

  Future<void> _openSettings() async {
    await showAppSettingsSheet(
      context,
      initialLanguage: ref.read(appLanguageProvider),
    );
  }

  @override
  void initState() {
    super.initState();
    _originController = TextEditingController();
    _destinationController = TextEditingController();
    _originFocusNode = FocusNode();
    _destinationFocusNode = FocusNode();
    _originController.addListener(_handleFieldStateChanged);
    _destinationController.addListener(_handleFieldStateChanged);
    _originFocusNode.addListener(_handleFocusChanged);
    _destinationFocusNode.addListener(_handleFocusChanged);
  }

  @override
  void dispose() {
    _originController.removeListener(_handleFieldStateChanged);
    _destinationController.removeListener(_handleFieldStateChanged);
    _originFocusNode.removeListener(_handleFocusChanged);
    _destinationFocusNode.removeListener(_handleFocusChanged);
    _originController.dispose();
    _destinationController.dispose();
    _originFocusNode.dispose();
    _destinationFocusNode.dispose();
    super.dispose();
  }

  void _openNextScreen() {
    final String origin = _originController.text.trim();
    final String destination = _destinationController.text.trim();
    context.push(
      '/route',
      extra: SearchRouteParams(
        origin: origin,
        destination: destination,
        voiceGuidanceEnabled: false,
      ),
    );
  }

  void _handleFocusChanged() {
    final _SearchField? nextActiveField = switch ((
      _originFocusNode.hasFocus,
      _destinationFocusNode.hasFocus,
    )) {
      (true, _) => _SearchField.origin,
      (false, true) => _SearchField.destination,
      _ => null,
    };

    if (_activeField == nextActiveField) {
      return;
    }

    setState(() {
      _activeField = nextActiveField;
    });
  }

  void _handleFieldStateChanged() {
    if (!mounted) {
      return;
    }

    setState(() {});
  }

  void _applySuggestion(StationSearchSuggestion suggestion) {
    final _SearchField? activeField = _activeField;
    if (activeField == null) {
      return;
    }

    final TextEditingController controller = activeField == _SearchField.origin
        ? _originController
        : _destinationController;
    controller.value = TextEditingValue(
      text: suggestion.displayText,
      selection: TextSelection.collapsed(offset: suggestion.displayText.length),
    );

    FocusScope.of(context).unfocus();
    setState(() {
      _activeField = null;
    });
  }

  List<StationSearchSuggestion> _buildSuggestions(
    AsyncValue<StationSearchLookup> lookupAsync,
    AppLanguage language,
  ) {
    final _SearchField? activeField = _activeField;
    if (activeField == null) {
      return const <StationSearchSuggestion>[];
    }

    final TextEditingController controller = activeField == _SearchField.origin
        ? _originController
        : _destinationController;
    final String query = controller.text.trim();
    if (query.isEmpty) {
      return const <StationSearchSuggestion>[];
    }

    return lookupAsync.maybeWhen(
      data: (StationSearchLookup lookup) =>
          lookup.filterSuggestions(query, preferredLanguage: language),
      orElse: () => const <StationSearchSuggestion>[],
    );
  }

  @override
  Widget build(BuildContext context) {
    final strings = ref.watch(appStringsProvider);
    final language = ref.watch(appLanguageProvider);
    final lookupAsync = ref.watch(stationSearchLookupProvider);
    final suggestions = _buildSuggestions(lookupAsync, language);
    final theme = Theme.of(context);
    final double keyboardInset = MediaQuery.of(context).viewInsets.bottom;
    final bool isKeyboardVisible = keyboardInset > 0;
    final double goButtonBottomOffset = isKeyboardVisible
        ? keyboardInset + 24
        : 108;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 232),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _SearchTopBar(
                          brand: strings.brand,
                          onSettingsPressed: _openSettings,
                        ),
                        const SizedBox(height: 36),
                        Text(
                          strings.searchHeading,
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: -2.4,
                            height: 0.95,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          strings.searchSubheading,
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: const Color(0xFF5C5B5B),
                            fontWeight: FontWeight.w700,
                            letterSpacing: language.isCjk ? 0 : 1.8,
                          ),
                        ),
                        const SizedBox(height: 36),
                        _SearchInputStack(
                          strings: strings,
                          originPlaceholder: strings.searchDefaultOrigin,
                          originController: _originController,
                          destinationController: _destinationController,
                          originFocusNode: _originFocusNode,
                          destinationFocusNode: _destinationFocusNode,
                          suggestions: suggestions,
                          activeField: _activeField,
                          onSuggestionSelected: _applySuggestion,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOutCubic,
                left: 24,
                right: 24,
                bottom: goButtonBottomOffset,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 520),
                    child: _GoButton(
                      label: strings.searchGoCta,
                      onPressed: _openNextScreen,
                    ),
                  ),
                ),
              ),
              AnimatedSlide(
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                offset: isKeyboardVisible ? const Offset(0, 1.2) : Offset.zero,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 140),
                  opacity: isKeyboardVisible ? 0 : 1,
                  child: IgnorePointer(
                    ignoring: isKeyboardVisible,
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: _BottomNavigationBar(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchTopBar extends StatelessWidget {
  const _SearchTopBar({required this.brand, required this.onSettingsPressed});

  final String brand;
  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.directions_subway_rounded, color: Color(0xFF0049E6)),
        const SizedBox(width: 8),
        Text(
          brand,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.w900,
            letterSpacing: -1.2,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: onSettingsPressed,
          style: IconButton.styleFrom(
            backgroundColor: const Color(0xFFEFF1F2),
            foregroundColor: const Color(0xFF595C5D),
          ),
          icon: const Icon(Icons.settings_outlined),
        ),
      ],
    );
  }
}

class _SearchInputStack extends StatelessWidget {
  const _SearchInputStack({
    required this.strings,
    required this.originPlaceholder,
    required this.originController,
    required this.destinationController,
    required this.originFocusNode,
    required this.destinationFocusNode,
    required this.suggestions,
    required this.activeField,
    required this.onSuggestionSelected,
  });

  final AppStrings strings;
  final String originPlaceholder;
  final TextEditingController originController;
  final TextEditingController destinationController;
  final FocusNode originFocusNode;
  final FocusNode destinationFocusNode;
  final List<StationSearchSuggestion> suggestions;
  final _SearchField? activeField;
  final ValueChanged<StationSearchSuggestion> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 28,
          top: 74,
          child: Container(
            width: 2,
            height: 34,
            color: const Color(0x4DABADAE),
          ),
        ),
        Column(
          children: [
            _JourneyTextField(
              controller: originController,
              focusNode: originFocusNode,
              hintText: originPlaceholder,
              labelText: strings.searchOriginHint,
              icon: Icons.my_location_rounded,
              iconColor: const Color(0xFF0049E6),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(height: 16),
            _JourneyTextField(
              controller: destinationController,
              focusNode: destinationFocusNode,
              hintText: strings.searchDestinationHint,
              labelText: null,
              icon: Icons.location_on_rounded,
              iconColor: const Color(0xFFB31B25),
              textInputAction: TextInputAction.done,
            ),
            if (activeField != null && suggestions.isNotEmpty) ...[
              const SizedBox(height: 16),
              _SuggestionList(
                suggestions: suggestions,
                onSuggestionSelected: onSuggestionSelected,
              ),
            ],
          ],
        ),
      ],
    );
  }
}

class _JourneyTextField extends StatelessWidget {
  const _JourneyTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    required this.labelText,
    required this.icon,
    required this.iconColor,
    required this.textInputAction,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hintText;
  final String? labelText;
  final IconData icon;
  final Color iconColor;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      key: ValueKey<String>('journey-field-$hintText'),
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: labelText == null
            ? FloatingLabelBehavior.never
            : FloatingLabelBehavior.always,
        labelStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: const Color(0xFF6C6F70),
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        hintText: hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Icon(icon, color: iconColor),
        ),
        prefixIconConstraints: const BoxConstraints(minWidth: 52),
        filled: true,
        fillColor: const Color(0xFFE0E3E4),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 24,
        ),
        alignLabelWithHint: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0x330049E6), width: 2),
        ),
      ),
    );
  }
}

class _SuggestionList extends StatelessWidget {
  const _SuggestionList({
    required this.suggestions,
    required this.onSuggestionSelected,
  });

  final List<StationSearchSuggestion> suggestions;
  final ValueChanged<StationSearchSuggestion> onSuggestionSelected;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: const Color(0xCCFFFFFF),
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ListView.separated(
        key: const ValueKey<String>('station-suggestion-list'),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: suggestions.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, indent: 24, endIndent: 24),
        itemBuilder: (context, index) {
          final StationSearchSuggestion suggestion = suggestions[index];
          return ListTile(
            dense: true,
            leading: const Icon(
              Icons.location_searching_rounded,
              color: Color(0xFF0049E6),
            ),
            title: Text(
              suggestion.displayText,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),
            onTap: () => onSuggestionSelected(suggestion),
          );
        },
      ),
    );
  }
}

class _GoButton extends StatelessWidget {
  const _GoButton({required this.label, required this.onPressed});

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0049E6), Color(0xFF829BFF)],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x14000000),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: SizedBox(
        height: 64,
        width: double.infinity,
        child: FilledButton(
          onPressed: onPressed,
          style: FilledButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: const Color(0xFFF2F1FF),
                  fontWeight: FontWeight.w900,
                  letterSpacing: 3.2,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_rounded, color: Color(0xFFF2F1FF)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends ConsumerWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = ref.watch(appStringsProvider);

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 18),
      decoration: const BoxDecoration(
        color: Color(0xCCFFFFFF),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 24,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _NavItem(
              icon: Icons.explore_rounded,
              label: strings.navNavigate,
              selected: true,
            ),
            _NavItem(
              icon: Icons.bookmark_border_rounded,
              label: strings.navSaved,
            ),
            _NavItem(icon: Icons.history_rounded, label: strings.navHistory),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    this.selected = false,
  });

  final IconData icon;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final Color foregroundColor = selected
        ? Colors.white
        : const Color(0xFF757778);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: selected ? const Color(0xFF0049E6) : Colors.transparent,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: foregroundColor),
            const SizedBox(height: 2),
            Text(
              label.toUpperCase(),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 10,
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SearchField { origin, destination }
