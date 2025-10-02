import 'dart:developer';

enum AppFlow { user, trainer }

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
}
