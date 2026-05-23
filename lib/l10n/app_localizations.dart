import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_id.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Tuto'**
  String get appTitle;

  /// No description provided for @kickoffEyebrow.
  ///
  /// In en, this message translates to:
  /// **'WELCOME TO TUTO'**
  String get kickoffEyebrow;

  /// No description provided for @kickoffTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get you\nset up!'**
  String get kickoffTitle;

  /// No description provided for @kickoffSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Who\'s holding the phone right now?'**
  String get kickoffSubtitle;

  /// No description provided for @kickoffGrownupTitle.
  ///
  /// In en, this message translates to:
  /// **'I\'m a grown-up'**
  String get kickoffGrownupTitle;

  /// No description provided for @kickoffGrownupSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Set up an account & add your kid'**
  String get kickoffGrownupSubtitle;

  /// No description provided for @kickoffKidTitle.
  ///
  /// In en, this message translates to:
  /// **'I\'m a kid'**
  String get kickoffKidTitle;

  /// No description provided for @kickoffKidSubtitle.
  ///
  /// In en, this message translates to:
  /// **'My grown-up already set me up'**
  String get kickoffKidSubtitle;

  /// No description provided for @kickoffHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get kickoffHaveAccount;

  /// No description provided for @kickoffLogIn.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get kickoffLogIn;

  /// No description provided for @kEnterCodeTitle.
  ///
  /// In en, this message translates to:
  /// **'Got a code from your\ngrown-up?'**
  String get kEnterCodeTitle;

  /// No description provided for @kEnterCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Type the 6 numbers they gave you below.'**
  String get kEnterCodeSubtitle;

  /// No description provided for @kEnterCodeError.
  ///
  /// In en, this message translates to:
  /// **'Hmm, that code didn\'t work. Try again? 💛'**
  String get kEnterCodeError;

  /// No description provided for @kEnterCodeTipStart.
  ///
  /// In en, this message translates to:
  /// **'Ask a grown-up. They can find the code on '**
  String get kEnterCodeTipStart;

  /// No description provided for @kEnterCodeTipBold.
  ///
  /// In en, this message translates to:
  /// **'their phone'**
  String get kEnterCodeTipBold;

  /// No description provided for @kEnterCodeTipEnd.
  ///
  /// In en, this message translates to:
  /// **' in the setup screen — or in Settings → Add another device.'**
  String get kEnterCodeTipEnd;

  /// No description provided for @kEnterCodeNoCode.
  ///
  /// In en, this message translates to:
  /// **'I don\'t have a code yet'**
  String get kEnterCodeNoCode;

  /// No description provided for @kEnterCodeFootnote.
  ///
  /// In en, this message translates to:
  /// **'A grown-up has to set up Tuto first 🐢'**
  String get kEnterCodeFootnote;

  /// No description provided for @kHelloTitle.
  ///
  /// In en, this message translates to:
  /// **'Hi Maya! I\'m Tuto 🐢'**
  String get kHelloTitle;

  /// No description provided for @kHelloSubtitle.
  ///
  /// In en, this message translates to:
  /// **'I\'m so excited to go on adventures\nand learn things together!'**
  String get kHelloSubtitle;

  /// No description provided for @kHelloChipStars.
  ///
  /// In en, this message translates to:
  /// **'Stars to earn'**
  String get kHelloChipStars;

  /// No description provided for @kHelloChipBadges.
  ///
  /// In en, this message translates to:
  /// **'Badges to collect'**
  String get kHelloChipBadges;

  /// No description provided for @kHelloChipQuests.
  ///
  /// In en, this message translates to:
  /// **'Quests ahead'**
  String get kHelloChipQuests;

  /// No description provided for @kHelloCta.
  ///
  /// In en, this message translates to:
  /// **'Let\'s go! →'**
  String get kHelloCta;

  /// No description provided for @kAvatarTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick your avatar!'**
  String get kAvatarTitle;

  /// No description provided for @kAvatarSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This is how you\'ll appear in Tuto.'**
  String get kAvatarSubtitle;

  /// No description provided for @kAvatarCta.
  ///
  /// In en, this message translates to:
  /// **'I pick {emoji}  →'**
  String kAvatarCta(String emoji);

  /// No description provided for @kInterestsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'WHAT DO YOU LOVE?'**
  String get kInterestsEyebrow;

  /// No description provided for @kInterestsTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick your favourites!'**
  String get kInterestsTitle;

  /// No description provided for @kInterestsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tuto will weave them into your lessons.'**
  String get kInterestsSubtitle;

  /// No description provided for @kInterestsCta.
  ///
  /// In en, this message translates to:
  /// **'That\'s me! →'**
  String get kInterestsCta;

  /// No description provided for @interestDinosaurs.
  ///
  /// In en, this message translates to:
  /// **'Dinosaurs'**
  String get interestDinosaurs;

  /// No description provided for @interestSpace.
  ///
  /// In en, this message translates to:
  /// **'Space'**
  String get interestSpace;

  /// No description provided for @interestOcean.
  ///
  /// In en, this message translates to:
  /// **'Ocean'**
  String get interestOcean;

  /// No description provided for @interestScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get interestScience;

  /// No description provided for @interestHeroes.
  ///
  /// In en, this message translates to:
  /// **'Heroes'**
  String get interestHeroes;

  /// No description provided for @interestNature.
  ///
  /// In en, this message translates to:
  /// **'Nature'**
  String get interestNature;

  /// No description provided for @interestArt.
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get interestArt;

  /// No description provided for @interestMusic.
  ///
  /// In en, this message translates to:
  /// **'Music'**
  String get interestMusic;

  /// No description provided for @interestSports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get interestSports;

  /// No description provided for @kReadyEyebrow.
  ///
  /// In en, this message translates to:
  /// **'YOU\'RE ALL SET!'**
  String get kReadyEyebrow;

  /// No description provided for @kReadyTitle.
  ///
  /// In en, this message translates to:
  /// **'Ready for your first quest?'**
  String get kReadyTitle;

  /// No description provided for @kReadySubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tuto is waiting for you on the map.\nLet the adventure begin!'**
  String get kReadySubtitle;

  /// No description provided for @kReadyFirstQuestLabel.
  ///
  /// In en, this message translates to:
  /// **'FIRST QUEST'**
  String get kReadyFirstQuestLabel;

  /// No description provided for @kReadyFirstQuestTitle.
  ///
  /// In en, this message translates to:
  /// **'Whales of the Deep'**
  String get kReadyFirstQuestTitle;

  /// No description provided for @kReadyCta.
  ///
  /// In en, this message translates to:
  /// **'Start my adventure! 🚀'**
  String get kReadyCta;

  /// No description provided for @pAccountEyebrow.
  ///
  /// In en, this message translates to:
  /// **'CREATE ACCOUNT'**
  String get pAccountEyebrow;

  /// No description provided for @pAccountTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s set up your\nparent account'**
  String get pAccountTitle;

  /// No description provided for @pAccountNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Your name'**
  String get pAccountNameLabel;

  /// No description provided for @pAccountNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Sarah'**
  String get pAccountNameHint;

  /// No description provided for @pAccountEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get pAccountEmailLabel;

  /// No description provided for @pAccountEmailHint.
  ///
  /// In en, this message translates to:
  /// **'sarah@example.com'**
  String get pAccountEmailHint;

  /// No description provided for @pAccountPasswordLabel.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get pAccountPasswordLabel;

  /// No description provided for @pAccountPasswordHint.
  ///
  /// In en, this message translates to:
  /// **'8+ characters'**
  String get pAccountPasswordHint;

  /// No description provided for @pAccountOrContinue.
  ///
  /// In en, this message translates to:
  /// **'or continue with'**
  String get pAccountOrContinue;

  /// No description provided for @pAccountTerms.
  ///
  /// In en, this message translates to:
  /// **'By continuing you agree to Tuto\'s Terms & Privacy Policy.'**
  String get pAccountTerms;

  /// No description provided for @ssoApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get ssoApple;

  /// No description provided for @ssoGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get ssoGoogle;

  /// No description provided for @pKidEyebrow.
  ///
  /// In en, this message translates to:
  /// **'ABOUT YOUR CHILD'**
  String get pKidEyebrow;

  /// No description provided for @pKidTitle.
  ///
  /// In en, this message translates to:
  /// **'Tell us a bit about\nyour little learner'**
  String get pKidTitle;

  /// No description provided for @pKidNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Child\'s name'**
  String get pKidNameLabel;

  /// No description provided for @pKidNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Maya'**
  String get pKidNameHint;

  /// No description provided for @pKidAgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get pKidAgeLabel;

  /// No description provided for @pKidTip.
  ///
  /// In en, this message translates to:
  /// **'Tuto adapts lessons to your child\'s age so content feels just right — not too easy, not too hard.'**
  String get pKidTip;

  /// No description provided for @pGoalsEyebrow.
  ///
  /// In en, this message translates to:
  /// **'LEARNING GOALS'**
  String get pGoalsEyebrow;

  /// No description provided for @pGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'What matters most\nto your family?'**
  String get pGoalsTitle;

  /// No description provided for @pGoalsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick all that apply. Tuto will personalise the experience.'**
  String get pGoalsSubtitle;

  /// No description provided for @goalReadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Build reading skills'**
  String get goalReadingTitle;

  /// No description provided for @goalReadingSub.
  ///
  /// In en, this message translates to:
  /// **'Stories, phonics & more'**
  String get goalReadingSub;

  /// No description provided for @goalCuriousTitle.
  ///
  /// In en, this message translates to:
  /// **'Stay curious'**
  String get goalCuriousTitle;

  /// No description provided for @goalCuriousSub.
  ///
  /// In en, this message translates to:
  /// **'Science, nature & wonder'**
  String get goalCuriousSub;

  /// No description provided for @goalMathsTitle.
  ///
  /// In en, this message translates to:
  /// **'Love maths'**
  String get goalMathsTitle;

  /// No description provided for @goalMathsSub.
  ///
  /// In en, this message translates to:
  /// **'Numbers made fun'**
  String get goalMathsSub;

  /// No description provided for @goalScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Less screen guilt'**
  String get goalScreenTitle;

  /// No description provided for @goalScreenSub.
  ///
  /// In en, this message translates to:
  /// **'Quality learning time'**
  String get goalScreenSub;

  /// No description provided for @goalConfidenceTitle.
  ///
  /// In en, this message translates to:
  /// **'Build confidence'**
  String get goalConfidenceTitle;

  /// No description provided for @goalConfidenceSub.
  ///
  /// In en, this message translates to:
  /// **'Try, learn, grow'**
  String get goalConfidenceSub;

  /// No description provided for @goalWorldTitle.
  ///
  /// In en, this message translates to:
  /// **'Explore the world'**
  String get goalWorldTitle;

  /// No description provided for @goalWorldSub.
  ///
  /// In en, this message translates to:
  /// **'Geography & cultures'**
  String get goalWorldSub;

  /// No description provided for @pPlanEyebrow.
  ///
  /// In en, this message translates to:
  /// **'LEARNING PLAN'**
  String get pPlanEyebrow;

  /// No description provided for @pPlanTitle.
  ///
  /// In en, this message translates to:
  /// **'How much time\neach day?'**
  String get pPlanTitle;

  /// No description provided for @pPlanSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Even 10 minutes a day builds big skills over time.'**
  String get pPlanSubtitle;

  /// No description provided for @pPlanDailyGoal.
  ///
  /// In en, this message translates to:
  /// **'Daily goal'**
  String get pPlanDailyGoal;

  /// No description provided for @pPlanMinuteUnit.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get pPlanMinuteUnit;

  /// No description provided for @pPlanWhichDays.
  ///
  /// In en, this message translates to:
  /// **'Which days?'**
  String get pPlanWhichDays;

  /// No description provided for @pPlanSummary.
  ///
  /// In en, this message translates to:
  /// **'{minutes} minutes, {days} days a week. That\'s a great plan!'**
  String pPlanSummary(int minutes, int days);

  /// No description provided for @pPlanCta.
  ///
  /// In en, this message translates to:
  /// **'All set — let\'s go! 🚀'**
  String get pPlanCta;

  /// No description provided for @dayInitialMon.
  ///
  /// In en, this message translates to:
  /// **'M'**
  String get dayInitialMon;

  /// No description provided for @dayInitialTue.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get dayInitialTue;

  /// No description provided for @dayInitialWed.
  ///
  /// In en, this message translates to:
  /// **'W'**
  String get dayInitialWed;

  /// No description provided for @dayInitialThu.
  ///
  /// In en, this message translates to:
  /// **'T'**
  String get dayInitialThu;

  /// No description provided for @dayInitialFri.
  ///
  /// In en, this message translates to:
  /// **'F'**
  String get dayInitialFri;

  /// No description provided for @dayInitialSat.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get dayInitialSat;

  /// No description provided for @dayInitialSun.
  ///
  /// In en, this message translates to:
  /// **'S'**
  String get dayInitialSun;

  /// No description provided for @pConnectEyebrow.
  ///
  /// In en, this message translates to:
  /// **'ALMOST THERE'**
  String get pConnectEyebrow;

  /// No description provided for @pConnectTitle.
  ///
  /// In en, this message translates to:
  /// **'Connect Maya\'s\naccount.'**
  String get pConnectTitle;

  /// No description provided for @pConnectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pick how Maya will use Tuto.'**
  String get pConnectSubtitle;

  /// No description provided for @pConnectDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Maya has her own device'**
  String get pConnectDeviceTitle;

  /// No description provided for @pConnectDeviceDesc.
  ///
  /// In en, this message translates to:
  /// **'Open Tuto on her phone/tablet, tap \"I\'m a kid\", and enter this code:'**
  String get pConnectDeviceDesc;

  /// No description provided for @pConnectExpires.
  ///
  /// In en, this message translates to:
  /// **'Expires in 10 min · '**
  String get pConnectExpires;

  /// No description provided for @pConnectRefresh.
  ///
  /// In en, this message translates to:
  /// **'refresh'**
  String get pConnectRefresh;

  /// No description provided for @pConnectWaiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for Maya…'**
  String get pConnectWaiting;

  /// No description provided for @pConnectOr.
  ///
  /// In en, this message translates to:
  /// **'OR'**
  String get pConnectOr;

  /// No description provided for @pConnectPassTitle.
  ///
  /// In en, this message translates to:
  /// **'Maya will use this phone'**
  String get pConnectPassTitle;

  /// No description provided for @pConnectPassDesc.
  ///
  /// In en, this message translates to:
  /// **'Pass it to her now — we\'ll set her up'**
  String get pConnectPassDesc;

  /// No description provided for @pConnectInviteTitle.
  ///
  /// In en, this message translates to:
  /// **'Invite another grown-up'**
  String get pConnectInviteTitle;

  /// No description provided for @pConnectInviteDesc.
  ///
  /// In en, this message translates to:
  /// **'Other parent, grandparent or guardian — they\'ll see Maya\'s progress too.'**
  String get pConnectInviteDesc;

  /// No description provided for @pConnectSkip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get pConnectSkip;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue →'**
  String get actionContinue;

  /// No description provided for @actionNext.
  ///
  /// In en, this message translates to:
  /// **'Next →'**
  String get actionNext;

  /// No description provided for @subjectScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get subjectScience;

  /// No description provided for @subjectReading.
  ///
  /// In en, this message translates to:
  /// **'Reading'**
  String get subjectReading;

  /// No description provided for @subjectMath.
  ///
  /// In en, this message translates to:
  /// **'Math'**
  String get subjectMath;

  /// No description provided for @subjectBonus.
  ///
  /// In en, this message translates to:
  /// **'Bonus'**
  String get subjectBonus;

  /// No description provided for @subjectWorld.
  ///
  /// In en, this message translates to:
  /// **'World'**
  String get subjectWorld;

  /// No description provided for @subjectArt.
  ///
  /// In en, this message translates to:
  /// **'Art'**
  String get subjectArt;

  /// No description provided for @subjectForYou.
  ///
  /// In en, this message translates to:
  /// **'For you'**
  String get subjectForYou;

  /// No description provided for @mapQuestLabel.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S QUEST'**
  String get mapQuestLabel;

  /// No description provided for @mapQuestTitle.
  ///
  /// In en, this message translates to:
  /// **'3 lessons to find the treasure'**
  String get mapQuestTitle;

  /// No description provided for @mapSpeech.
  ///
  /// In en, this message translates to:
  /// **'Slow and steady — let\'s count some stars together.'**
  String get mapSpeech;

  /// No description provided for @mapTreasureHint.
  ///
  /// In en, this message translates to:
  /// **'finish all to unlock treasure'**
  String get mapTreasureHint;

  /// No description provided for @mapNodeWhales.
  ///
  /// In en, this message translates to:
  /// **'Whales'**
  String get mapNodeWhales;

  /// No description provided for @mapNodeFoxTale.
  ///
  /// In en, this message translates to:
  /// **'Fox tale'**
  String get mapNodeFoxTale;

  /// No description provided for @mapNodeCounting.
  ///
  /// In en, this message translates to:
  /// **'Counting'**
  String get mapNodeCounting;

  /// No description provided for @mapNodeVolcano.
  ///
  /// In en, this message translates to:
  /// **'Volcano'**
  String get mapNodeVolcano;

  /// No description provided for @mapNodeRhymes.
  ///
  /// In en, this message translates to:
  /// **'Rhymes'**
  String get mapNodeRhymes;

  /// No description provided for @mapNodeTreasure.
  ///
  /// In en, this message translates to:
  /// **'Treasure'**
  String get mapNodeTreasure;

  /// No description provided for @lessonEyebrow.
  ///
  /// In en, this message translates to:
  /// **'LESSON 3 · MATH'**
  String get lessonEyebrow;

  /// No description provided for @lessonTitle.
  ///
  /// In en, this message translates to:
  /// **'Counting stars'**
  String get lessonTitle;

  /// No description provided for @lessonChipTime.
  ///
  /// In en, this message translates to:
  /// **'5 min'**
  String get lessonChipTime;

  /// No description provided for @lessonChipStars.
  ///
  /// In en, this message translates to:
  /// **'3 stars to earn'**
  String get lessonChipStars;

  /// No description provided for @lessonChipWords.
  ///
  /// In en, this message translates to:
  /// **'New words: 4'**
  String get lessonChipWords;

  /// No description provided for @lessonSpeech.
  ///
  /// In en, this message translates to:
  /// **'Let\'s count things together. I\'ll go first, then it\'s your turn!'**
  String get lessonSpeech;

  /// No description provided for @lessonCta.
  ///
  /// In en, this message translates to:
  /// **'Let\'s start!'**
  String get lessonCta;

  /// No description provided for @miniGameEyebrow.
  ///
  /// In en, this message translates to:
  /// **'YOUR TURN'**
  String get miniGameEyebrow;

  /// No description provided for @miniGamePromptStart.
  ///
  /// In en, this message translates to:
  /// **'Tap '**
  String get miniGamePromptStart;

  /// No description provided for @miniGamePromptHighlight.
  ///
  /// In en, this message translates to:
  /// **'Five stars'**
  String get miniGamePromptHighlight;

  /// No description provided for @miniGamePromptEnd.
  ///
  /// In en, this message translates to:
  /// **' to send to Tuto'**
  String get miniGamePromptEnd;

  /// No description provided for @miniGameTappedLabel.
  ///
  /// In en, this message translates to:
  /// **'Tapped: '**
  String get miniGameTappedLabel;

  /// No description provided for @miniGameSuccess.
  ///
  /// In en, this message translates to:
  /// **'Yes! Five shiny stars ✨'**
  String get miniGameSuccess;

  /// No description provided for @quizEyebrow.
  ///
  /// In en, this message translates to:
  /// **'QUESTION 3 OF 4'**
  String get quizEyebrow;

  /// No description provided for @quizQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many stars did we count?'**
  String get quizQuestion;

  /// No description provided for @quizAnswerFive.
  ///
  /// In en, this message translates to:
  /// **'Five 🌟'**
  String get quizAnswerFive;

  /// No description provided for @quizAnswerFour.
  ///
  /// In en, this message translates to:
  /// **'Four'**
  String get quizAnswerFour;

  /// No description provided for @quizAnswerSix.
  ///
  /// In en, this message translates to:
  /// **'Six'**
  String get quizAnswerSix;

  /// No description provided for @quizAnswerThree.
  ///
  /// In en, this message translates to:
  /// **'Three'**
  String get quizAnswerThree;

  /// No description provided for @quizGentle.
  ///
  /// In en, this message translates to:
  /// **'Almost! Let\'s try again 💛'**
  String get quizGentle;

  /// No description provided for @quizCorrect.
  ///
  /// In en, this message translates to:
  /// **'That\'s right! ✨'**
  String get quizCorrect;

  /// No description provided for @quizHint.
  ///
  /// In en, this message translates to:
  /// **'Hint'**
  String get quizHint;

  /// No description provided for @rewardEyebrow.
  ///
  /// In en, this message translates to:
  /// **'QUEST COMPLETE'**
  String get rewardEyebrow;

  /// No description provided for @rewardTitle.
  ///
  /// In en, this message translates to:
  /// **'Treasure found!'**
  String get rewardTitle;

  /// No description provided for @rewardSubtitle.
  ///
  /// In en, this message translates to:
  /// **'You counted, you read, you crushed it.'**
  String get rewardSubtitle;

  /// No description provided for @rewardChipStars.
  ///
  /// In en, this message translates to:
  /// **'+3 stars'**
  String get rewardChipStars;

  /// No description provided for @rewardChipStreak.
  ///
  /// In en, this message translates to:
  /// **'8 day streak!'**
  String get rewardChipStreak;

  /// No description provided for @rewardNewBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'NEW BADGE'**
  String get rewardNewBadgeLabel;

  /// No description provided for @rewardBadgeDesc.
  ///
  /// In en, this message translates to:
  /// **'Counted Five stars in one go.'**
  String get rewardBadgeDesc;

  /// No description provided for @rewardContinue.
  ///
  /// In en, this message translates to:
  /// **'Keep going!'**
  String get rewardContinue;

  /// No description provided for @rewardSeeBadges.
  ///
  /// In en, this message translates to:
  /// **'See all badges'**
  String get rewardSeeBadges;

  /// No description provided for @badgesEyebrow.
  ///
  /// In en, this message translates to:
  /// **'YOUR COLLECTION'**
  String get badgesEyebrow;

  /// No description provided for @badgesCount.
  ///
  /// In en, this message translates to:
  /// **'{count} badges so far'**
  String badgesCount(int count);

  /// No description provided for @badgesNewTag.
  ///
  /// In en, this message translates to:
  /// **'NEW'**
  String get badgesNewTag;

  /// No description provided for @badgeStarCounter.
  ///
  /// In en, this message translates to:
  /// **'Star Counter'**
  String get badgeStarCounter;

  /// No description provided for @badgeStarCounterSub.
  ///
  /// In en, this message translates to:
  /// **'Just earned!'**
  String get badgeStarCounterSub;

  /// No description provided for @badgeSeaExplorer.
  ///
  /// In en, this message translates to:
  /// **'Sea Explorer'**
  String get badgeSeaExplorer;

  /// No description provided for @badgeSeaExplorerSub.
  ///
  /// In en, this message translates to:
  /// **'Whales lesson'**
  String get badgeSeaExplorerSub;

  /// No description provided for @badgeBraveReader.
  ///
  /// In en, this message translates to:
  /// **'Brave Reader'**
  String get badgeBraveReader;

  /// No description provided for @badgeBraveReaderSub.
  ///
  /// In en, this message translates to:
  /// **'3 stories'**
  String get badgeBraveReaderSub;

  /// No description provided for @badgeOnFire.
  ///
  /// In en, this message translates to:
  /// **'On Fire'**
  String get badgeOnFire;

  /// No description provided for @badgeOnFireSub.
  ///
  /// In en, this message translates to:
  /// **'7 day streak'**
  String get badgeOnFireSub;

  /// No description provided for @badgeVolcanoPal.
  ///
  /// In en, this message translates to:
  /// **'Volcano Pal'**
  String get badgeVolcanoPal;

  /// No description provided for @badgeVolcanoPalSub.
  ///
  /// In en, this message translates to:
  /// **'Locked'**
  String get badgeVolcanoPalSub;

  /// No description provided for @badgeWordWizard.
  ///
  /// In en, this message translates to:
  /// **'Word Wizard'**
  String get badgeWordWizard;

  /// No description provided for @badgeWordWizardSub.
  ///
  /// In en, this message translates to:
  /// **'100 words'**
  String get badgeWordWizardSub;

  /// No description provided for @badgeNightOwl.
  ///
  /// In en, this message translates to:
  /// **'Night Owl'**
  String get badgeNightOwl;

  /// No description provided for @badgeNightOwlSub.
  ///
  /// In en, this message translates to:
  /// **'Read at night'**
  String get badgeNightOwlSub;

  /// No description provided for @badgeColorful.
  ///
  /// In en, this message translates to:
  /// **'Colorful'**
  String get badgeColorful;

  /// No description provided for @badgeColorfulSub.
  ///
  /// In en, this message translates to:
  /// **'All subjects'**
  String get badgeColorfulSub;

  /// No description provided for @badgeStarHoarder.
  ///
  /// In en, this message translates to:
  /// **'Star Hoarder'**
  String get badgeStarHoarder;

  /// No description provided for @badgeStarHoarderSub.
  ///
  /// In en, this message translates to:
  /// **'50 stars'**
  String get badgeStarHoarderSub;

  /// No description provided for @libraryEyebrow.
  ///
  /// In en, this message translates to:
  /// **'LIBRARY'**
  String get libraryEyebrow;

  /// No description provided for @libraryTitle.
  ///
  /// In en, this message translates to:
  /// **'What sounds fun today?'**
  String get libraryTitle;

  /// No description provided for @librarySearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search lessons, stories…'**
  String get librarySearchHint;

  /// No description provided for @libraryFeaturedTag.
  ///
  /// In en, this message translates to:
  /// **'FEATURED'**
  String get libraryFeaturedTag;

  /// No description provided for @libraryFeaturedSubject.
  ///
  /// In en, this message translates to:
  /// **'📖 Reading'**
  String get libraryFeaturedSubject;

  /// No description provided for @libraryFeaturedTitle.
  ///
  /// In en, this message translates to:
  /// **'The Lighthouse Keeper'**
  String get libraryFeaturedTitle;

  /// No description provided for @libraryFeaturedDesc.
  ///
  /// In en, this message translates to:
  /// **'A 7-minute story about courage'**
  String get libraryFeaturedDesc;

  /// No description provided for @libraryListenNow.
  ///
  /// In en, this message translates to:
  /// **'▶  Listen now'**
  String get libraryListenNow;

  /// No description provided for @libraryContinueTitle.
  ///
  /// In en, this message translates to:
  /// **'Pick up where you left off'**
  String get libraryContinueTitle;

  /// No description provided for @libraryContinueSub.
  ///
  /// In en, this message translates to:
  /// **'3 in progress'**
  String get libraryContinueSub;

  /// No description provided for @librarySeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get librarySeeAll;

  /// No description provided for @libraryTipLabel.
  ///
  /// In en, this message translates to:
  /// **'TUTO PICKS'**
  String get libraryTipLabel;

  /// No description provided for @libraryTipTitle.
  ///
  /// In en, this message translates to:
  /// **'Want a daily surprise?'**
  String get libraryTipTitle;

  /// No description provided for @libraryTipDesc.
  ///
  /// In en, this message translates to:
  /// **'I\'ll mix something new with your favorites.'**
  String get libraryTipDesc;

  /// No description provided for @libraryTipCta.
  ///
  /// In en, this message translates to:
  /// **'Try it'**
  String get libraryTipCta;

  /// No description provided for @libraryCardMinutes.
  ///
  /// In en, this message translates to:
  /// **'⏱ {minutes} min'**
  String libraryCardMinutes(int minutes);

  /// No description provided for @levelNew.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get levelNew;

  /// No description provided for @levelEasy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get levelEasy;

  /// No description provided for @libContinueWhales.
  ///
  /// In en, this message translates to:
  /// **'Whales of the deep sea'**
  String get libContinueWhales;

  /// No description provided for @libContinueWhalesSub.
  ///
  /// In en, this message translates to:
  /// **'Science · 4 min left'**
  String get libContinueWhalesSub;

  /// No description provided for @libContinueFox.
  ///
  /// In en, this message translates to:
  /// **'The brave little fox'**
  String get libContinueFox;

  /// No description provided for @libContinueFoxSub.
  ///
  /// In en, this message translates to:
  /// **'Reading · 2 min left'**
  String get libContinueFoxSub;

  /// No description provided for @libContinueCounting.
  ///
  /// In en, this message translates to:
  /// **'Counting stars'**
  String get libContinueCounting;

  /// No description provided for @libContinueCountingSub.
  ///
  /// In en, this message translates to:
  /// **'Math · just started'**
  String get libContinueCountingSub;

  /// No description provided for @libColAnimals.
  ///
  /// In en, this message translates to:
  /// **'Amazing animals'**
  String get libColAnimals;

  /// No description provided for @libColAnimalsSub.
  ///
  /// In en, this message translates to:
  /// **'8 lessons'**
  String get libColAnimalsSub;

  /// No description provided for @libColBedtime.
  ///
  /// In en, this message translates to:
  /// **'Bedtime stories'**
  String get libColBedtime;

  /// No description provided for @libColBedtimeSub.
  ///
  /// In en, this message translates to:
  /// **'12 stories'**
  String get libColBedtimeSub;

  /// No description provided for @libColWhy.
  ///
  /// In en, this message translates to:
  /// **'Why is that?'**
  String get libColWhy;

  /// No description provided for @libColWhySub.
  ///
  /// In en, this message translates to:
  /// **'6 explainers'**
  String get libColWhySub;

  /// No description provided for @libItemWhales.
  ///
  /// In en, this message translates to:
  /// **'Whales'**
  String get libItemWhales;

  /// No description provided for @libItemLions.
  ///
  /// In en, this message translates to:
  /// **'Lions'**
  String get libItemLions;

  /// No description provided for @libItemSeaTurtles.
  ///
  /// In en, this message translates to:
  /// **'Sea turtles'**
  String get libItemSeaTurtles;

  /// No description provided for @libItemButterflies.
  ///
  /// In en, this message translates to:
  /// **'Butterflies'**
  String get libItemButterflies;

  /// No description provided for @libItemFox.
  ///
  /// In en, this message translates to:
  /// **'Brave little fox'**
  String get libItemFox;

  /// No description provided for @libItemMoon.
  ///
  /// In en, this message translates to:
  /// **'Moon and the rabbit'**
  String get libItemMoon;

  /// No description provided for @libItemBear.
  ///
  /// In en, this message translates to:
  /// **'Bear who sang'**
  String get libItemBear;

  /// No description provided for @libItemLighthouse.
  ///
  /// In en, this message translates to:
  /// **'Lighthouse keeper'**
  String get libItemLighthouse;

  /// No description provided for @libItemVolcano.
  ///
  /// In en, this message translates to:
  /// **'Why volcanoes erupt'**
  String get libItemVolcano;

  /// No description provided for @libItemRainbow.
  ///
  /// In en, this message translates to:
  /// **'How rainbows happen'**
  String get libItemRainbow;

  /// No description provided for @libItemStars.
  ///
  /// In en, this message translates to:
  /// **'Why stars twinkle'**
  String get libItemStars;

  /// No description provided for @libItemBees.
  ///
  /// In en, this message translates to:
  /// **'How bees make honey'**
  String get libItemBees;

  /// No description provided for @meName.
  ///
  /// In en, this message translates to:
  /// **'Maya, 8'**
  String get meName;

  /// No description provided for @meSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learning since April · Level 4'**
  String get meSubtitle;

  /// No description provided for @meStatStreak.
  ///
  /// In en, this message translates to:
  /// **'STREAK'**
  String get meStatStreak;

  /// No description provided for @meStatStars.
  ///
  /// In en, this message translates to:
  /// **'STARS'**
  String get meStatStars;

  /// No description provided for @meStatBadges.
  ///
  /// In en, this message translates to:
  /// **'BADGES'**
  String get meStatBadges;

  /// No description provided for @meSettingsLabel.
  ///
  /// In en, this message translates to:
  /// **'SETTINGS'**
  String get meSettingsLabel;

  /// No description provided for @meSettingAvatar.
  ///
  /// In en, this message translates to:
  /// **'Change avatar'**
  String get meSettingAvatar;

  /// No description provided for @meSettingAvatarSub.
  ///
  /// In en, this message translates to:
  /// **'Pick a new buddy'**
  String get meSettingAvatarSub;

  /// No description provided for @meSettingVoice.
  ///
  /// In en, this message translates to:
  /// **'Tuto\'s voice'**
  String get meSettingVoice;

  /// No description provided for @meSettingVoiceSub.
  ///
  /// In en, this message translates to:
  /// **'Cheery'**
  String get meSettingVoiceSub;

  /// No description provided for @meSettingSounds.
  ///
  /// In en, this message translates to:
  /// **'Sounds & music'**
  String get meSettingSounds;

  /// No description provided for @meSettingSoundsSub.
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get meSettingSoundsSub;

  /// No description provided for @meSettingBedtime.
  ///
  /// In en, this message translates to:
  /// **'Bedtime mode'**
  String get meSettingBedtime;

  /// No description provided for @meSettingBedtimeSub.
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get meSettingBedtimeSub;

  /// No description provided for @parentGateTitle.
  ///
  /// In en, this message translates to:
  /// **'Parent zone'**
  String get parentGateTitle;

  /// No description provided for @parentGateSolve.
  ///
  /// In en, this message translates to:
  /// **'Solve to continue'**
  String get parentGateSolve;

  /// No description provided for @parentGateHint.
  ///
  /// In en, this message translates to:
  /// **'This makes sure a grown-up is in control.'**
  String get parentGateHint;

  /// No description provided for @parentDashGreeting.
  ///
  /// In en, this message translates to:
  /// **'Hey, Parent 👋'**
  String get parentDashGreeting;

  /// No description provided for @parentDashSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Here\'s how Maya is doing this week.'**
  String get parentDashSubtitle;

  /// No description provided for @parentDashStatStars.
  ///
  /// In en, this message translates to:
  /// **'Stars'**
  String get parentDashStatStars;

  /// No description provided for @parentDashStatStreak.
  ///
  /// In en, this message translates to:
  /// **'Day streak'**
  String get parentDashStatStreak;

  /// No description provided for @parentDashStatLessons.
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get parentDashStatLessons;

  /// No description provided for @parentDashMinutesLabel.
  ///
  /// In en, this message translates to:
  /// **'MINUTES THIS WEEK'**
  String get parentDashMinutesLabel;

  /// No description provided for @parentDashMinutesTotal.
  ///
  /// In en, this message translates to:
  /// **'68 min total'**
  String get parentDashMinutesTotal;

  /// No description provided for @parentDashSubjectsLabel.
  ///
  /// In en, this message translates to:
  /// **'SUBJECTS'**
  String get parentDashSubjectsLabel;

  /// No description provided for @parentDashSubjectMaths.
  ///
  /// In en, this message translates to:
  /// **'Maths'**
  String get parentDashSubjectMaths;

  /// No description provided for @parentDashWeeklyTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly report'**
  String get parentDashWeeklyTitle;

  /// No description provided for @parentDashWeeklySub.
  ///
  /// In en, this message translates to:
  /// **'Full breakdown + Tuto insights'**
  String get parentDashWeeklySub;

  /// No description provided for @parentDashLimitTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily limit'**
  String get parentDashLimitTitle;

  /// No description provided for @parentDashLimitSub.
  ///
  /// In en, this message translates to:
  /// **'15 min / day · Mon–Fri'**
  String get parentDashLimitSub;

  /// No description provided for @parentDashGoalsTitle.
  ///
  /// In en, this message translates to:
  /// **'Learning goals'**
  String get parentDashGoalsTitle;

  /// No description provided for @parentDashGoalsSub.
  ///
  /// In en, this message translates to:
  /// **'Reading, Curiosity, Maths'**
  String get parentDashGoalsSub;

  /// No description provided for @weeklyReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get weeklyReportTitle;

  /// No description provided for @weeklyTutoSaysLabel.
  ///
  /// In en, this message translates to:
  /// **'TUTO SAYS'**
  String get weeklyTutoSaysLabel;

  /// No description provided for @weeklyTutoSaysText.
  ///
  /// In en, this message translates to:
  /// **'Maya is really finding her groove! She improved her reading speed by 15% and attempted maths every single day.'**
  String get weeklyTutoSaysText;

  /// No description provided for @weeklyHighlightsLabel.
  ///
  /// In en, this message translates to:
  /// **'HIGHLIGHTS'**
  String get weeklyHighlightsLabel;

  /// No description provided for @weeklyHighlight1.
  ///
  /// In en, this message translates to:
  /// **'Finished the Whales of the Deep quest — first time in under 8 minutes!'**
  String get weeklyHighlight1;

  /// No description provided for @weeklyHighlight2.
  ///
  /// In en, this message translates to:
  /// **'Got 4/4 on the counting quiz. No hints needed!'**
  String get weeklyHighlight2;

  /// No description provided for @weeklyHighlight3.
  ///
  /// In en, this message translates to:
  /// **'Kept a 7-day streak going — her longest ever!'**
  String get weeklyHighlight3;

  /// No description provided for @weeklyThisWeekLabel.
  ///
  /// In en, this message translates to:
  /// **'THIS WEEK'**
  String get weeklyThisWeekLabel;

  /// No description provided for @weeklyStatTimeValue.
  ///
  /// In en, this message translates to:
  /// **'68 min'**
  String get weeklyStatTimeValue;

  /// No description provided for @weeklyStatTimeLabel.
  ///
  /// In en, this message translates to:
  /// **'Learning time'**
  String get weeklyStatTimeLabel;

  /// No description provided for @weeklyStatLessonsValue.
  ///
  /// In en, this message translates to:
  /// **'3'**
  String get weeklyStatLessonsValue;

  /// No description provided for @weeklyStatLessonsLabel.
  ///
  /// In en, this message translates to:
  /// **'Lessons done'**
  String get weeklyStatLessonsLabel;

  /// No description provided for @weeklyStatStarsValue.
  ///
  /// In en, this message translates to:
  /// **'+12'**
  String get weeklyStatStarsValue;

  /// No description provided for @weeklyStatStarsLabel.
  ///
  /// In en, this message translates to:
  /// **'Stars earned'**
  String get weeklyStatStarsLabel;

  /// No description provided for @weeklyStatBadgeValue.
  ///
  /// In en, this message translates to:
  /// **'1 new'**
  String get weeklyStatBadgeValue;

  /// No description provided for @weeklyStatBadgeLabel.
  ///
  /// In en, this message translates to:
  /// **'Badge unlocked'**
  String get weeklyStatBadgeLabel;

  /// No description provided for @weeklyNextWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'Next week suggestion'**
  String get weeklyNextWeekTitle;

  /// No description provided for @weeklyNextWeekText.
  ///
  /// In en, this message translates to:
  /// **'Try adding a weekend session — Maya is most engaged on Saturdays!'**
  String get weeklyNextWeekText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'id':
      return AppLocalizationsId();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
