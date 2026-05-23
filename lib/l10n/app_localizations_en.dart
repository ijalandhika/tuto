// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Tuto';

  @override
  String get kickoffEyebrow => 'WELCOME TO TUTO';

  @override
  String get kickoffTitle => 'Let\'s get you\nset up!';

  @override
  String get kickoffSubtitle => 'Who\'s holding the phone right now?';

  @override
  String get kickoffGrownupTitle => 'I\'m a grown-up';

  @override
  String get kickoffGrownupSubtitle => 'Set up an account & add your kid';

  @override
  String get kickoffKidTitle => 'I\'m a kid';

  @override
  String get kickoffKidSubtitle => 'My grown-up already set me up';

  @override
  String get kickoffHaveAccount => 'Already have an account? ';

  @override
  String get kickoffLogIn => 'Log in';

  @override
  String get kEnterCodeTitle => 'Got a code from your\ngrown-up?';

  @override
  String get kEnterCodeSubtitle => 'Type the 6 numbers they gave you below.';

  @override
  String get kEnterCodeError => 'Hmm, that code didn\'t work. Try again? 💛';

  @override
  String get kEnterCodeTipStart => 'Ask a grown-up. They can find the code on ';

  @override
  String get kEnterCodeTipBold => 'their phone';

  @override
  String get kEnterCodeTipEnd =>
      ' in the setup screen — or in Settings → Add another device.';

  @override
  String get kEnterCodeNoCode => 'I don\'t have a code yet';

  @override
  String get kEnterCodeFootnote => 'A grown-up has to set up Tuto first 🐢';

  @override
  String get kHelloTitle => 'Hi Maya! I\'m Tuto 🐢';

  @override
  String get kHelloSubtitle =>
      'I\'m so excited to go on adventures\nand learn things together!';

  @override
  String get kHelloChipStars => 'Stars to earn';

  @override
  String get kHelloChipBadges => 'Badges to collect';

  @override
  String get kHelloChipQuests => 'Quests ahead';

  @override
  String get kHelloCta => 'Let\'s go! →';

  @override
  String get kAvatarTitle => 'Pick your avatar!';

  @override
  String get kAvatarSubtitle => 'This is how you\'ll appear in Tuto.';

  @override
  String kAvatarCta(String emoji) {
    return 'I pick $emoji  →';
  }

  @override
  String get kInterestsEyebrow => 'WHAT DO YOU LOVE?';

  @override
  String get kInterestsTitle => 'Pick your favourites!';

  @override
  String get kInterestsSubtitle => 'Tuto will weave them into your lessons.';

  @override
  String get kInterestsCta => 'That\'s me! →';

  @override
  String get interestDinosaurs => 'Dinosaurs';

  @override
  String get interestSpace => 'Space';

  @override
  String get interestOcean => 'Ocean';

  @override
  String get interestScience => 'Science';

  @override
  String get interestHeroes => 'Heroes';

  @override
  String get interestNature => 'Nature';

  @override
  String get interestArt => 'Art';

  @override
  String get interestMusic => 'Music';

  @override
  String get interestSports => 'Sports';

  @override
  String get kReadyEyebrow => 'YOU\'RE ALL SET!';

  @override
  String get kReadyTitle => 'Ready for your first quest?';

  @override
  String get kReadySubtitle =>
      'Tuto is waiting for you on the map.\nLet the adventure begin!';

  @override
  String get kReadyFirstQuestLabel => 'FIRST QUEST';

  @override
  String get kReadyFirstQuestTitle => 'Whales of the Deep';

  @override
  String get kReadyCta => 'Start my adventure! 🚀';

  @override
  String get pAccountEyebrow => 'CREATE ACCOUNT';

  @override
  String get pAccountTitle => 'Let\'s set up your\nparent account';

  @override
  String get pAccountNameLabel => 'Your name';

  @override
  String get pAccountNameHint => 'e.g. Sarah';

  @override
  String get pAccountEmailLabel => 'Email address';

  @override
  String get pAccountEmailHint => 'sarah@example.com';

  @override
  String get pAccountPasswordLabel => 'Password';

  @override
  String get pAccountPasswordHint => '8+ characters';

  @override
  String get pAccountOrContinue => 'or continue with';

  @override
  String get pAccountTerms =>
      'By continuing you agree to Tuto\'s Terms & Privacy Policy.';

  @override
  String get ssoApple => 'Apple';

  @override
  String get ssoGoogle => 'Google';

  @override
  String get pKidEyebrow => 'ABOUT YOUR CHILD';

  @override
  String get pKidTitle => 'Tell us a bit about\nyour little learner';

  @override
  String get pKidNameLabel => 'Child\'s name';

  @override
  String get pKidNameHint => 'e.g. Maya';

  @override
  String get pKidAgeLabel => 'Age';

  @override
  String get pKidTip =>
      'Tuto adapts lessons to your child\'s age so content feels just right — not too easy, not too hard.';

  @override
  String get pGoalsEyebrow => 'LEARNING GOALS';

  @override
  String get pGoalsTitle => 'What matters most\nto your family?';

  @override
  String get pGoalsSubtitle =>
      'Pick all that apply. Tuto will personalise the experience.';

  @override
  String get goalReadingTitle => 'Build reading skills';

  @override
  String get goalReadingSub => 'Stories, phonics & more';

  @override
  String get goalCuriousTitle => 'Stay curious';

  @override
  String get goalCuriousSub => 'Science, nature & wonder';

  @override
  String get goalMathsTitle => 'Love maths';

  @override
  String get goalMathsSub => 'Numbers made fun';

  @override
  String get goalScreenTitle => 'Less screen guilt';

  @override
  String get goalScreenSub => 'Quality learning time';

  @override
  String get goalConfidenceTitle => 'Build confidence';

  @override
  String get goalConfidenceSub => 'Try, learn, grow';

  @override
  String get goalWorldTitle => 'Explore the world';

  @override
  String get goalWorldSub => 'Geography & cultures';

  @override
  String get pPlanEyebrow => 'LEARNING PLAN';

  @override
  String get pPlanTitle => 'How much time\neach day?';

  @override
  String get pPlanSubtitle =>
      'Even 10 minutes a day builds big skills over time.';

  @override
  String get pPlanDailyGoal => 'Daily goal';

  @override
  String get pPlanMinuteUnit => 'min';

  @override
  String get pPlanWhichDays => 'Which days?';

  @override
  String pPlanSummary(int minutes, int days) {
    return '$minutes minutes, $days days a week. That\'s a great plan!';
  }

  @override
  String get pPlanCta => 'All set — let\'s go! 🚀';

  @override
  String get dayInitialMon => 'M';

  @override
  String get dayInitialTue => 'T';

  @override
  String get dayInitialWed => 'W';

  @override
  String get dayInitialThu => 'T';

  @override
  String get dayInitialFri => 'F';

  @override
  String get dayInitialSat => 'S';

  @override
  String get dayInitialSun => 'S';

  @override
  String get pConnectEyebrow => 'ALMOST THERE';

  @override
  String get pConnectTitle => 'Connect Maya\'s\naccount.';

  @override
  String get pConnectSubtitle => 'Pick how Maya will use Tuto.';

  @override
  String get pConnectDeviceTitle => 'Maya has her own device';

  @override
  String get pConnectDeviceDesc =>
      'Open Tuto on her phone/tablet, tap \"I\'m a kid\", and enter this code:';

  @override
  String get pConnectExpires => 'Expires in 10 min · ';

  @override
  String get pConnectRefresh => 'refresh';

  @override
  String get pConnectWaiting => 'Waiting for Maya…';

  @override
  String get pConnectOr => 'OR';

  @override
  String get pConnectPassTitle => 'Maya will use this phone';

  @override
  String get pConnectPassDesc => 'Pass it to her now — we\'ll set her up';

  @override
  String get pConnectInviteTitle => 'Invite another grown-up';

  @override
  String get pConnectInviteDesc =>
      'Other parent, grandparent or guardian — they\'ll see Maya\'s progress too.';

  @override
  String get pConnectSkip => 'Skip';

  @override
  String get actionContinue => 'Continue →';

  @override
  String get actionNext => 'Next →';

  @override
  String get subjectScience => 'Science';

  @override
  String get subjectReading => 'Reading';

  @override
  String get subjectMath => 'Math';

  @override
  String get subjectBonus => 'Bonus';

  @override
  String get subjectWorld => 'World';

  @override
  String get subjectArt => 'Art';

  @override
  String get subjectForYou => 'For you';

  @override
  String get mapQuestLabel => 'TODAY\'S QUEST';

  @override
  String get mapQuestTitle => '3 lessons to find the treasure';

  @override
  String get mapSpeech => 'Slow and steady — let\'s count some stars together.';

  @override
  String get mapTreasureHint => 'finish all to unlock treasure';

  @override
  String get mapNodeWhales => 'Whales';

  @override
  String get mapNodeFoxTale => 'Fox tale';

  @override
  String get mapNodeCounting => 'Counting';

  @override
  String get mapNodeVolcano => 'Volcano';

  @override
  String get mapNodeRhymes => 'Rhymes';

  @override
  String get mapNodeTreasure => 'Treasure';

  @override
  String get lessonEyebrow => 'LESSON 3 · MATH';

  @override
  String get lessonTitle => 'Counting stars';

  @override
  String get lessonChipTime => '5 min';

  @override
  String get lessonChipStars => '3 stars to earn';

  @override
  String get lessonChipWords => 'New words: 4';

  @override
  String get lessonSpeech =>
      'Let\'s count things together. I\'ll go first, then it\'s your turn!';

  @override
  String get lessonCta => 'Let\'s start!';

  @override
  String get miniGameEyebrow => 'YOUR TURN';

  @override
  String get miniGamePromptStart => 'Tap ';

  @override
  String get miniGamePromptHighlight => 'Five stars';

  @override
  String get miniGamePromptEnd => ' to send to Tuto';

  @override
  String get miniGameTappedLabel => 'Tapped: ';

  @override
  String get miniGameSuccess => 'Yes! Five shiny stars ✨';

  @override
  String get quizEyebrow => 'QUESTION 3 OF 4';

  @override
  String get quizQuestion => 'How many stars did we count?';

  @override
  String get quizAnswerFive => 'Five 🌟';

  @override
  String get quizAnswerFour => 'Four';

  @override
  String get quizAnswerSix => 'Six';

  @override
  String get quizAnswerThree => 'Three';

  @override
  String get quizGentle => 'Almost! Let\'s try again 💛';

  @override
  String get quizCorrect => 'That\'s right! ✨';

  @override
  String get quizHint => 'Hint';

  @override
  String get rewardEyebrow => 'QUEST COMPLETE';

  @override
  String get rewardTitle => 'Treasure found!';

  @override
  String get rewardSubtitle => 'You counted, you read, you crushed it.';

  @override
  String get rewardChipStars => '+3 stars';

  @override
  String get rewardChipStreak => '8 day streak!';

  @override
  String get rewardNewBadgeLabel => 'NEW BADGE';

  @override
  String get rewardBadgeDesc => 'Counted Five stars in one go.';

  @override
  String get rewardContinue => 'Keep going!';

  @override
  String get rewardSeeBadges => 'See all badges';

  @override
  String get badgesEyebrow => 'YOUR COLLECTION';

  @override
  String badgesCount(int count) {
    return '$count badges so far';
  }

  @override
  String get badgesNewTag => 'NEW';

  @override
  String get badgeStarCounter => 'Star Counter';

  @override
  String get badgeStarCounterSub => 'Just earned!';

  @override
  String get badgeSeaExplorer => 'Sea Explorer';

  @override
  String get badgeSeaExplorerSub => 'Whales lesson';

  @override
  String get badgeBraveReader => 'Brave Reader';

  @override
  String get badgeBraveReaderSub => '3 stories';

  @override
  String get badgeOnFire => 'On Fire';

  @override
  String get badgeOnFireSub => '7 day streak';

  @override
  String get badgeVolcanoPal => 'Volcano Pal';

  @override
  String get badgeVolcanoPalSub => 'Locked';

  @override
  String get badgeWordWizard => 'Word Wizard';

  @override
  String get badgeWordWizardSub => '100 words';

  @override
  String get badgeNightOwl => 'Night Owl';

  @override
  String get badgeNightOwlSub => 'Read at night';

  @override
  String get badgeColorful => 'Colorful';

  @override
  String get badgeColorfulSub => 'All subjects';

  @override
  String get badgeStarHoarder => 'Star Hoarder';

  @override
  String get badgeStarHoarderSub => '50 stars';

  @override
  String get libraryEyebrow => 'LIBRARY';

  @override
  String get libraryTitle => 'What sounds fun today?';

  @override
  String get librarySearchHint => 'Search lessons, stories…';

  @override
  String get libraryFeaturedTag => 'FEATURED';

  @override
  String get libraryFeaturedSubject => '📖 Reading';

  @override
  String get libraryFeaturedTitle => 'The Lighthouse Keeper';

  @override
  String get libraryFeaturedDesc => 'A 7-minute story about courage';

  @override
  String get libraryListenNow => '▶  Listen now';

  @override
  String get libraryContinueTitle => 'Pick up where you left off';

  @override
  String get libraryContinueSub => '3 in progress';

  @override
  String get librarySeeAll => 'See all';

  @override
  String get libraryTipLabel => 'TUTO PICKS';

  @override
  String get libraryTipTitle => 'Want a daily surprise?';

  @override
  String get libraryTipDesc => 'I\'ll mix something new with your favorites.';

  @override
  String get libraryTipCta => 'Try it';

  @override
  String libraryCardMinutes(int minutes) {
    return '⏱ $minutes min';
  }

  @override
  String get levelNew => 'New';

  @override
  String get levelEasy => 'Easy';

  @override
  String get libContinueWhales => 'Whales of the deep sea';

  @override
  String get libContinueWhalesSub => 'Science · 4 min left';

  @override
  String get libContinueFox => 'The brave little fox';

  @override
  String get libContinueFoxSub => 'Reading · 2 min left';

  @override
  String get libContinueCounting => 'Counting stars';

  @override
  String get libContinueCountingSub => 'Math · just started';

  @override
  String get libColAnimals => 'Amazing animals';

  @override
  String get libColAnimalsSub => '8 lessons';

  @override
  String get libColBedtime => 'Bedtime stories';

  @override
  String get libColBedtimeSub => '12 stories';

  @override
  String get libColWhy => 'Why is that?';

  @override
  String get libColWhySub => '6 explainers';

  @override
  String get libItemWhales => 'Whales';

  @override
  String get libItemLions => 'Lions';

  @override
  String get libItemSeaTurtles => 'Sea turtles';

  @override
  String get libItemButterflies => 'Butterflies';

  @override
  String get libItemFox => 'Brave little fox';

  @override
  String get libItemMoon => 'Moon and the rabbit';

  @override
  String get libItemBear => 'Bear who sang';

  @override
  String get libItemLighthouse => 'Lighthouse keeper';

  @override
  String get libItemVolcano => 'Why volcanoes erupt';

  @override
  String get libItemRainbow => 'How rainbows happen';

  @override
  String get libItemStars => 'Why stars twinkle';

  @override
  String get libItemBees => 'How bees make honey';

  @override
  String get meName => 'Maya, 8';

  @override
  String get meSubtitle => 'Learning since April · Level 4';

  @override
  String get meStatStreak => 'STREAK';

  @override
  String get meStatStars => 'STARS';

  @override
  String get meStatBadges => 'BADGES';

  @override
  String get meSettingsLabel => 'SETTINGS';

  @override
  String get meSettingAvatar => 'Change avatar';

  @override
  String get meSettingAvatarSub => 'Pick a new buddy';

  @override
  String get meSettingVoice => 'Tuto\'s voice';

  @override
  String get meSettingVoiceSub => 'Cheery';

  @override
  String get meSettingSounds => 'Sounds & music';

  @override
  String get meSettingSoundsSub => 'On';

  @override
  String get meSettingBedtime => 'Bedtime mode';

  @override
  String get meSettingBedtimeSub => 'Off';

  @override
  String get parentGateTitle => 'Parent zone';

  @override
  String get parentGateSolve => 'Solve to continue';

  @override
  String get parentGateHint => 'This makes sure a grown-up is in control.';

  @override
  String get parentDashGreeting => 'Hey, Parent 👋';

  @override
  String get parentDashSubtitle => 'Here\'s how Maya is doing this week.';

  @override
  String get parentDashStatStars => 'Stars';

  @override
  String get parentDashStatStreak => 'Day streak';

  @override
  String get parentDashStatLessons => 'Lessons';

  @override
  String get parentDashMinutesLabel => 'MINUTES THIS WEEK';

  @override
  String get parentDashMinutesTotal => '68 min total';

  @override
  String get parentDashSubjectsLabel => 'SUBJECTS';

  @override
  String get parentDashSubjectMaths => 'Maths';

  @override
  String get parentDashWeeklyTitle => 'Weekly report';

  @override
  String get parentDashWeeklySub => 'Full breakdown + Tuto insights';

  @override
  String get parentDashLimitTitle => 'Daily limit';

  @override
  String get parentDashLimitSub => '15 min / day · Mon–Fri';

  @override
  String get parentDashGoalsTitle => 'Learning goals';

  @override
  String get parentDashGoalsSub => 'Reading, Curiosity, Maths';

  @override
  String get weeklyReportTitle => 'Weekly Report';

  @override
  String get weeklyTutoSaysLabel => 'TUTO SAYS';

  @override
  String get weeklyTutoSaysText =>
      'Maya is really finding her groove! She improved her reading speed by 15% and attempted maths every single day.';

  @override
  String get weeklyHighlightsLabel => 'HIGHLIGHTS';

  @override
  String get weeklyHighlight1 =>
      'Finished the Whales of the Deep quest — first time in under 8 minutes!';

  @override
  String get weeklyHighlight2 =>
      'Got 4/4 on the counting quiz. No hints needed!';

  @override
  String get weeklyHighlight3 =>
      'Kept a 7-day streak going — her longest ever!';

  @override
  String get weeklyThisWeekLabel => 'THIS WEEK';

  @override
  String get weeklyStatTimeValue => '68 min';

  @override
  String get weeklyStatTimeLabel => 'Learning time';

  @override
  String get weeklyStatLessonsValue => '3';

  @override
  String get weeklyStatLessonsLabel => 'Lessons done';

  @override
  String get weeklyStatStarsValue => '+12';

  @override
  String get weeklyStatStarsLabel => 'Stars earned';

  @override
  String get weeklyStatBadgeValue => '1 new';

  @override
  String get weeklyStatBadgeLabel => 'Badge unlocked';

  @override
  String get weeklyNextWeekTitle => 'Next week suggestion';

  @override
  String get weeklyNextWeekText =>
      'Try adding a weekend session — Maya is most engaged on Saturdays!';
}
