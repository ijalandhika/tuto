# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This workspace contains the Tuto Flutter app and its Go backend API.

| Project | Path | Stack |
|---|---|---|
| Flutter app | `tuto/tuto/` | Flutter / Dart |
| Backend API | `tuto/tuto-api/` | Go, chi, PostgreSQL |

---

## Flutter App (`tuto/tuto/`)

### Commands
```bash
flutter run          # Run on connected device/emulator
flutter test         # Run tests
flutter analyze      # Lint/analyze
flutter build apk    # Build Android APK
```

### Architecture

**Navigation** — flat `_Screen` enum + `setState` state machine in `_AppShellState` (`lib/main.dart`). No routing library. Every transition is `_goto(_Screen.x)`. The bottom tab bar renders only when `_screen ∈ {map, badges, library, me}`.

Navigation flow:
```
kickoff → pAccount → pKid → pGoals → pPlan → pConnect → kHello
        → kEnterCode ──────────────────────────────────→ kHello
kHello → kAvatar → kInterests → kReady → map
map → lesson → miniGame → quiz → reward
map → parentGate → parentDash → weekly
```

**Design system** — two layers:
- `lib/design/tokens.dart` — `LumioColors`, `LumioSpacing`, `LumioRadius`, `LumioShadows`
- `lib/design/text_styles.dart` — Nunito text ramp

**Atom widgets** (`lib/widgets/`):
- `button.dart` — `LumioButton` (7 variants: primary/audio/success/warning/secondary/soft/ghost), `LumioIconButton`
- `chip.dart` — `LumioChip` (6 variants, 2 sizes)
- `progress_bar.dart` — `LumioProgressBar` (4 fills: gradient/accent/success/audio)
- `speech_bubble.dart` — `SpeechBubble` with turtle mascot + speaking animation
- `top_bar.dart` — `TopBar` with optional back, streak/hearts/stars chips, trailing slot
- `icon.dart` — `LumioIcon(LumioIconType.x)` wraps SVG assets via `ColorFilter`; 11 icons (back, check, chevronRight, close, flame, heart, lock, settings, sparkle, speaker, star)
- `animations.dart` — `BobAnimation`, `BounceAnimation`, `PopIn`, `PulseAnimation`, `FadeInUp`, `ShakeAnimation`
- `path_node.dart` — `PathNode` for map screen zigzag path

**Assets**:
- `assets/tuto-turtle.svg` — mascot used across multiple screens
- `assets/icons/` — 11 custom SVG icons, all using `currentColor` for tinting

**Shared onboarding widgets** — `lib/screens/onboarding/onboarding_widgets.dart` holds `OnboardingTopBar` and `LumioTextField` as public classes. These must stay public (not `_`-prefixed) because Dart private classes cannot be accessed across files.

