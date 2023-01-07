import 'package:curvy_app/constants/routes.dart';
import 'package:curvy_app/ui/screens/archives.dart';
import 'package:curvy_app/ui/screens/chat.dart';
import 'package:curvy_app/ui/screens/delete_account_last_chance.dart';
import 'package:curvy_app/ui/screens/delete_account_why.dart';
import 'package:curvy_app/ui/screens/edit_profile.dart';
import 'package:curvy_app/ui/screens/explore.dart';
import 'package:curvy_app/ui/screens/hub.dart';
import 'package:curvy_app/ui/screens/index.dart';
import 'package:curvy_app/ui/screens/login.dart';
import 'package:curvy_app/ui/screens/main_screen.dart';
import 'package:curvy_app/ui/screens/matching.dart';
import 'package:curvy_app/ui/screens/messages.dart';
import 'package:curvy_app/ui/screens/save_account.dart';
import 'package:curvy_app/ui/screens/send_feedback.dart';
import 'package:curvy_app/ui/screens/settings.dart';
import 'package:curvy_app/ui/screens/setup_add_image.dart';
import 'package:curvy_app/ui/screens/setup_birthdate.dart';
import 'package:curvy_app/ui/screens/setup_image.dart';
import 'package:curvy_app/ui/screens/setup_interests.dart';
import 'package:curvy_app/ui/screens/setup_name.dart';
import 'package:curvy_app/ui/screens/setup_sex.dart';
import 'package:curvy_app/ui/screens/setup_sexual_preference.dart';
import 'package:curvy_app/ui/screens/setup_showme.dart';
import 'package:curvy_app/ui/screens/user_detail.dart';
import 'package:curvy_app/ui/screens/validation_code.dart';
import 'package:curvy_app/ui/screens/validation_mail.dart';
import 'package:curvy_app/ui/screens/validation_number.dart';
import 'package:curvy_app/ui/screens/welcome_screen.dart';
import 'package:curvy_app/ui/util/login_bindings.dart';
import 'package:curvy_app/ui/util/page_guard.dart';
import 'package:get/get.dart';

final pages = [
  GetPage(
    name: Routes.login,
    page: () => LoginScreen(),
    binding: LoginBindings(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.saveAccount,
    page: () => SaveAccountScreen(),
  ),
  GetPage(
    name: Routes.validationNumber,
    page: () => ValidationNumberScreen(),
  ),
  GetPage(
    name: Routes.validationCode,
    page: () => ValidationCodeScreen(),
  ),
  GetPage(
    name: Routes.validationMail,
    page: () => ValidationMailScreen(),
  ),
  GetPage(
    name: Routes.welcome,
    page: () => WelcomeScreen(),
  ),
  GetPage(
    name: Routes.setupName,
    page: () => SetupNameScreen(),
  ),
  GetPage(
    name: Routes.setupBirthdate,
    page: () => SetupBirthdateScreen(),
  ),
  GetPage(
    name: Routes.setupSex,
    page: () => SetupSexScreen(),
  ),
  GetPage(
    name: Routes.setupSexualPreference,
    page: () => SetupSexualPreferenceScreen(),
  ),
  GetPage(
    name: Routes.setupShowme,
    page: () => SetupShowmeScreen(),
  ),
  GetPage(
    name: Routes.setupInterests,
    page: () => SetupInterestsScreen(),
  ),
  GetPage(
    name: Routes.setupImage,
    page: () => SetupImageScreen(),
  ),
  GetPage(
    name: Routes.setupAddImage,
    page: () => SetupAddImageScreen(),
  ),
  GetPage(
    name: Routes.index,
    page: () => MainScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.settings,
    page: () => SettingsScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.deleteAccountLastChance,
    page: () => DeleteAccountLastChanceScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.deleteAccountWhy,
    page: () => DeleteAccountWhyScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.sendFeedback,
    page: () => SendFeedbackScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.editProfile,
    page: () => EditProfileScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
 
 
  GetPage(
    name: Routes.chat,
    page: () => ChatScreen(),
    middlewares: [
      PageGuard()
    ]
  ),

  GetPage(
    name: Routes.hub, 
    page: () => HubScreen(),
    middlewares: [
      PageGuard()
    ]
  ),
  GetPage(
    name: Routes.userDetail, 
    page: () => UserDetailScreen(),
    middlewares: [
      PageGuard()
    ]
  )
  
];