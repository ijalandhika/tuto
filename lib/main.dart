import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'design/tokens.dart';
import 'screens/badges_screen.dart';
import 'screens/lesson_intro_screen.dart';
import 'screens/library_screen.dart';
import 'screens/map_screen.dart';
import 'screens/me_screen.dart';
import 'screens/mini_game_screen.dart';
import 'screens/onboarding/k_avatar_screen.dart';
import 'screens/onboarding/k_enter_code_screen.dart';
import 'screens/onboarding/k_hello_screen.dart';
import 'screens/onboarding/k_interests_screen.dart';
import 'screens/onboarding/k_ready_screen.dart';
import 'screens/onboarding/kickoff_screen.dart';
import 'screens/onboarding/p_account_screen.dart';
import 'screens/onboarding/p_connect_screen.dart';
import 'screens/onboarding/p_goals_screen.dart';
import 'screens/onboarding/p_kid_screen.dart';
import 'screens/onboarding/p_plan_screen.dart';
import 'screens/parent_dashboard_screen.dart';
import 'screens/parent_gate_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/reward_screen.dart';
import 'screens/weekly_report_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const TutoApp());
}

class TutoApp extends StatelessWidget {
  const TutoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tuto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: LumioColors.accent),
        scaffoldBackgroundColor: LumioColors.bg,
        textTheme: GoogleFonts.nunitoTextTheme(),
        useMaterial3: true,
      ),
      home: const _AppShell(),
    );
  }
}

// ── Screen enum ──────────────────────────────────────────────────────────────

enum _Screen {
  // Onboarding
  kickoff,
  pAccount,
  pKid,
  pGoals,
  pPlan,
  pConnect,
  kEnterCode,
  kHello,
  kAvatar,
  kInterests,
  kReady,
  // Main app
  map,
  lesson,
  miniGame,
  quiz,
  reward,
  badges,
  library,
  me,
  // Parent zone
  parentGate,
  parentDash,
  weekly,
}

// ── Bottom tab ───────────────────────────────────────────────────────────────

enum _Tab { home, library, badges, me }

// ── Root shell ───────────────────────────────────────────────────────────────

class _AppShell extends StatefulWidget {
  const _AppShell();

  @override
  State<_AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<_AppShell> {
  _Screen _screen = _Screen.kickoff;
  _Tab _tab = _Tab.home;
  final List<_Screen> _history = [];

  static const _tabScreens = {
    _Screen.map,
    _Screen.badges,
    _Screen.library,
    _Screen.me,
  };

  static const _tabFor = {
    _Screen.map: _Tab.home,
    _Screen.library: _Tab.library,
    _Screen.badges: _Tab.badges,
    _Screen.me: _Tab.me,
  };

  bool get _showTabBar => _tabScreens.contains(_screen);

  void _goto(_Screen s) {
    setState(() {
      _history.add(_screen);
      _screen = s;
    });
  }

  void _goBack() {
    if (_history.isEmpty) return;
    setState(() {
      _screen = _history.removeLast();
      final t = _tabFor[_screen];
      if (t != null) _tab = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        if (_history.isNotEmpty) {
          _goBack();
        } else {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
      backgroundColor: LumioColors.bg,
      body: SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: _showTabBar ? 72 : 0,
                    child: _buildScreen(),
                  ),
                  if (_showTabBar)
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _TabBar(
                        tab: _tab,
                        onTap: (t) {
                          setState(() {
                            _tab = t;
                            switch (t) {
                              case _Tab.home:
                                _goto(_Screen.map);
                              case _Tab.library:
                                _goto(_Screen.library);
                              case _Tab.badges:
                                _goto(_Screen.badges);
                              case _Tab.me:
                                _goto(_Screen.me);
                            }
                          });
                        },
                      ),
                    ),
                ],
              ),
            ),
      ),
    );
  }

  Widget _buildScreen() {
    switch (_screen) {
      // ── Onboarding ──────────────────────────────────────────────────────
      case _Screen.kickoff:
        return KickoffScreen(
          onParent: () => _goto(_Screen.pAccount),
          onChild: () => _goto(_Screen.kEnterCode),
        );
      case _Screen.pAccount:
        return PAccountScreen(
          onBack: () => _goto(_Screen.kickoff),
          onNext: () => _goto(_Screen.pKid),
        );
      case _Screen.pKid:
        return PKidScreen(
          onBack: () => _goto(_Screen.pAccount),
          onNext: () => _goto(_Screen.pGoals),
        );
      case _Screen.pGoals:
        return PGoalsScreen(
          onBack: () => _goto(_Screen.pKid),
          onNext: () => _goto(_Screen.pPlan),
        );
      case _Screen.pPlan:
        return PPlanScreen(
          onBack: () => _goto(_Screen.pGoals),
          onFinish: () => _goto(_Screen.pConnect),
        );
      case _Screen.pConnect:
        return PConnectScreen(
          onBack: () => _goto(_Screen.pPlan),
          onPassPhone: () => _goto(_Screen.kHello),
          onCode: () => _goto(_Screen.kHello),
        );
      case _Screen.kEnterCode:
        return KEnterCodeScreen(
          onBack: () => _goto(_Screen.kickoff),
          onSuccess: () => _goto(_Screen.kHello),
        );
      case _Screen.kHello:
        return KHelloScreen(
          onNext: () => _goto(_Screen.kAvatar),
        );
      case _Screen.kAvatar:
        return KAvatarScreen(
          onBack: () => _goto(_Screen.kHello),
          onNext: () => _goto(_Screen.kInterests),
        );
      case _Screen.kInterests:
        return KInterestsScreen(
          onBack: () => _goto(_Screen.kAvatar),
          onNext: () => _goto(_Screen.kReady),
        );
      case _Screen.kReady:
        return KReadyScreen(
          onBack: () => _goto(_Screen.kInterests),
          onFinish: () => _goto(_Screen.map),
        );

      // ── Main app ─────────────────────────────────────────────────────────
      case _Screen.map:
        return MapScreen(
          onStartLesson: () => _goto(_Screen.lesson),
          onParent: () => _goto(_Screen.parentGate),
        );
      case _Screen.lesson:
        return LessonIntroScreen(
          onBack: () => _goto(_Screen.map),
          onNext: () => _goto(_Screen.miniGame),
        );
      case _Screen.miniGame:
        return MiniGameScreen(
          onBack: () => _goto(_Screen.lesson),
          onNext: () => _goto(_Screen.quiz),
        );
      case _Screen.quiz:
        return QuizScreen(
          onBack: () => _goto(_Screen.miniGame),
          onComplete: () => _goto(_Screen.reward),
        );
      case _Screen.reward:
        return RewardScreen(
          onContinue: () => _goto(_Screen.map),
          onBadges: () {
            setState(() => _tab = _Tab.badges);
            _goto(_Screen.badges);
          },
        );
      case _Screen.badges:
        return BadgesScreen(
          onBack: () {
            setState(() => _tab = _Tab.home);
            _goto(_Screen.map);
          },
        );
      case _Screen.library:
        return LibraryScreen(
          onPick: () => _goto(_Screen.lesson),
        );
      case _Screen.me:
        return const MeScreen();

      // ── Parent zone ──────────────────────────────────────────────────────
      case _Screen.parentGate:
        return ParentGateScreen(
          onUnlock: () => _goto(_Screen.parentDash),
          onCancel: () => _goto(_Screen.map),
        );
      case _Screen.parentDash:
        return ParentDashboardScreen(
          onBack: () => _goto(_Screen.map),
          onWeekly: () => _goto(_Screen.weekly),
        );
      case _Screen.weekly:
        return WeeklyReportScreen(
          onBack: () => _goto(_Screen.parentDash),
        );
    }
  }
}

// ── Tab bar ──────────────────────────────────────────────────────────────────

class _TabBar extends StatelessWidget {
  final _Tab tab;
  final ValueChanged<_Tab> onTap;

  const _TabBar({required this.tab, required this.onTap});

  static const _items = [
    (_Tab.home, '🏠', 'Home'),
    (_Tab.library, '📚', 'Library'),
    (_Tab.badges, '★', 'Badges'),
    (_Tab.me, '👤', 'Me'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: LumioColors.border, width: 1)),
      ),
      padding: EdgeInsets.only(
        left: 14,
        right: 14,
        top: 10,
        bottom: MediaQuery.of(context).padding.bottom + 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _items.map((item) {
          final (t, icon, label) = item;
          final active = tab == t;
          return GestureDetector(
            onTap: () => onTap(t),
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(icon,
                      style: TextStyle(
                          fontSize: 22,
                          color: active
                              ? LumioColors.accentDeep
                              : LumioColors.textSoft)),
                  const SizedBox(height: 2),
                  Text(
                    label,
                    style: GoogleFonts.nunito(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: active
                          ? LumioColors.accentDeep
                          : LumioColors.textSoft,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
