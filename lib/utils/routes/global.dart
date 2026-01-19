import 'dart:developer';

enum AppFlow { user, trainer }

enum EmotionScreenMode { onboarding, fromHome, fromCompetencies }
enum HowitWorks { onBoarding, drawer }

enum PaymentConfirmation { fromappointments, fromsubscription }

enum VerificationFlow {
  signUp,
  forgotPassword,
}

enum UserRole { user, trainer }

class G {
  static final G _instance = G._internal();
  factory G() => _instance;
  G._internal();

  UserRole user = UserRole.trainer;

  void setUserRole(UserRole newRole) {
    user = newRole;
  }

  AppFlow _flow = AppFlow.user;
  AppFlow get flow => _flow;

  set flow(AppFlow newRole) {
    _flow = newRole;
    log(flow.toString());
  }
  EmotionScreenMode _emotionScreenMode = EmotionScreenMode.onboarding;
    EmotionScreenMode get emotionScreenMode => _emotionScreenMode;

  set emotionScreenMode (EmotionScreenMode newMode) {
    _emotionScreenMode = newMode;
    log(emotionScreenMode.toString());
  }
  PaymentConfirmation _paymentConfirmation =
      PaymentConfirmation.fromappointments;
  PaymentConfirmation get paymentConfirmation => _paymentConfirmation;

  set paymentConfirmation(PaymentConfirmation newConfirmation) {
    _paymentConfirmation = newConfirmation;
    log(paymentConfirmation.toString());
  }

  VerificationFlow _verification = VerificationFlow.signUp;
  VerificationFlow get verification => _verification;

  set verification(VerificationFlow newFlow) {
    _verification = verification;
  }

  HowitWorks _howitWorks = HowitWorks.onBoarding;
  HowitWorks get howitWorks => _howitWorks;

  set howitWorks(HowitWorks newWork) {
    _howitWorks = newWork;
    log(howitWorks.toString());
  }
}
