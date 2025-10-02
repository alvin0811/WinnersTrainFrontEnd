import 'dart:developer';

enum VerificationFlow { signUp, forgotPassword }

enum AppFlow { user, trainer }



class G {
  static final G _instance = G._internal();
  factory G() => _instance;
  G._internal();




 

  AppFlow _flow = AppFlow.user;
  AppFlow get flow => _flow;

  set flow(AppFlow newRole) {
    _flow = newRole;
    log(flow.toString());
  }

 





  VerificationFlow _verification = VerificationFlow.signUp;
  VerificationFlow get verification => _verification;

  set verification(VerificationFlow newFlow) {
    _verification = verification;
  }
}
