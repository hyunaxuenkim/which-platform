import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late final TextEditingController _originController;
  late final TextEditingController _destinationController;

  @override
  void initState() {
    super.initState();
    _originController = TextEditingController(text: '서울역');
    _destinationController = TextEditingController();
  }

  @override
  void dispose() {
    _originController.dispose();
    _destinationController.dispose();
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

  @override
  Widget build(BuildContext context) {
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
                          onSettingsPressed: () => context.push('/debug'),
                        ),
                        const SizedBox(height: 36),
                        Text(
                          'Where to?',
                          style: theme.textTheme.displayMedium?.copyWith(
                            fontWeight: FontWeight.w900,
                            letterSpacing: -2.4,
                            height: 0.95,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'PLAN YOUR NEXT CONNECTION',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: const Color(0xFF5C5B5B),
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.8,
                          ),
                        ),
                        const SizedBox(height: 36),
                        _SearchInputStack(
                          originController: _originController,
                          destinationController: _destinationController,
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
                    child: _GoButton(onPressed: _openNextScreen),
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
  const _SearchTopBar({required this.onSettingsPressed});

  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.directions_subway_rounded, color: Color(0xFF0049E6)),
        const SizedBox(width: 8),
        Text(
          'Wayfinder',
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
    required this.originController,
    required this.destinationController,
  });

  final TextEditingController originController;
  final TextEditingController destinationController;

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
              hintText: '출발역',
              icon: Icons.my_location_rounded,
              iconColor: const Color(0xFF0049E6),
            ),
            const SizedBox(height: 16),
            _JourneyTextField(
              controller: destinationController,
              hintText: '도착역 또는 목적지',
              icon: Icons.location_on_rounded,
              iconColor: const Color(0xFFB31B25),
            ),
          ],
        ),
      ],
    );
  }
}

class _JourneyTextField extends StatelessWidget {
  const _JourneyTextField({
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.iconColor,
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w800,
        letterSpacing: -0.6,
      ),
      decoration: InputDecoration(
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

class _GoButton extends StatelessWidget {
  const _GoButton({required this.onPressed});

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
                'GO',
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

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
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
          children: const [
            _NavItem(
              icon: Icons.explore_rounded,
              label: 'Navigate',
              selected: true,
            ),
            _NavItem(icon: Icons.bookmark_border_rounded, label: 'Saved'),
            _NavItem(icon: Icons.history_rounded, label: 'History'),
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

class RoutePlaceholderPage extends StatelessWidget {
  const RoutePlaceholderPage({super.key, this.params});

  final SearchRouteParams? params;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final String summary = switch (params) {
      SearchRouteParams(:final origin, :final destination) =>
        '${origin.isEmpty ? '출발역 미입력' : origin} → '
            '${destination.isEmpty ? '도착역 미입력' : destination}',
      null => '입력 정보 없음',
    };

    return Scaffold(
      appBar: AppBar(title: const Text('방향 결과 준비중')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Screen 2는 다음 단계에서 이어서 구현할 예정입니다.',
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              summary,
              style: theme.textTheme.titleLarge?.copyWith(
                color: const Color(0xFF2C2F30),
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              params?.voiceGuidanceEnabled == true
                  ? '음성 안내가 켜진 상태로 전달되었습니다.'
                  : '음성 안내가 꺼진 상태로 전달되었습니다.',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: const Color(0xFF595C5D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchRouteParams {
  const SearchRouteParams({
    required this.origin,
    required this.destination,
    required this.voiceGuidanceEnabled,
  });

  final String origin;
  final String destination;
  final bool voiceGuidanceEnabled;
}
