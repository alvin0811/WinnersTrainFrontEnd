import 'package:winner_trains_app/utils/app_enums.dart';
import 'package:winner_trains_app/utils/routes/global.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/profile_verification.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/reset_password.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/verification_Code.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/trainer_appointment_report_issue.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/trainer_cancel_appointment.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/trainer_ongoing_appointment_report.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/trainer_feedback_submitted.dart';
import 'package:winner_trains_app/view/trainer_flow/home/trainer_report_submittes.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/ongoing-appointments/join_live_session.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/ongoing-appointments/ongoing_report_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/forget_password.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/login_screen.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/prelogin.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/reset_password.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/signup_screen.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/action_plan_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/align_your_goals.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/brain_storming_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/break_the_loop_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/bright_side_reflection_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/capture_belief_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/celebrate_win_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/choose_strength_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/clarify_control_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/competencies_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/conversation_builder_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/core_strength_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/define_problem_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/dig_deeper_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/encouraging_words_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/enery_reset_prompt_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/flip_the_lens_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/high_energy_moments.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/identify_driver_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/identify_loop_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/identify_the_strength_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/impact_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/leadership_scenario_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/meaningful_support_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/micro_training_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/pattern_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/rebuilt_reset_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/reframe_prompt_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/reframe_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/set_your_intention_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/setback_reflection_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/situation_prompt_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/situation_snapshot_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/stimulus_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/strategic_reframe.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/strength_application_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/stress_spike_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/target_focus_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/tip_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/trigger_reflection_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/video_view.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/what_did_you_learn_view.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/help_and_feedback/help_and_feedback.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/help_and_feedback/success_feedback.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/about_app.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/change_password.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/privacy_policy.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/settings.dart';
import 'package:winner_trains_app/view/user_resilience/drawer/settings/terms&conditions.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/comments_screen.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/videos_reel.dart';
import 'package:winner_trains_app/view/user_resilience/home/user_main_home_screen.dart';
import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/pre_login.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/trainer_login.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/ongoing-appointments/ongoing_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/cancel_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/completed_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/submit_review.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/success_review.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/past_appointments/unattended_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/cancel_reason.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/reschedule_booking.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/reschedule_booking_details.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/success_appointment_cancel.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/success_reschedule_appointment.dart';
import 'package:winner_trains_app/view/user_resilience/appointments/upcoming_appointments/upcoming_appointments.dart';
import 'package:winner_trains_app/view/user_resilience/auth/views/otp_screen.dart';
import 'package:winner_trains_app/view/user_resilience/communities/discover_community.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/best_resilience_trainer.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/book_marked_resilience_trainer.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/booking_details.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/bookingschedule.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/live_session.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/new_card.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/payment_history.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/payment_method.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/reviews.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/search_resilience_trainer.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/subscription_screen.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/success_schedule_appointment.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/success_upgrade_plan.dart';
import 'package:winner_trains_app/view/user_resilience/home/Trainer/trainer_profile.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/report_issue.dart';
import 'package:winner_trains_app/view/user_resilience/home/feed/success_report.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/create_post.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/edit_post.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/saved_post.dart';
import 'package:winner_trains_app/view/user_resilience/home/post/success_post_created.dart';

import 'package:winner_trains_app/view/user_resilience/others/agreement.dart';
import 'package:winner_trains_app/view/user_resilience/others/notifications.dart';
import 'package:winner_trains_app/view/splash/role_screen.dart';
import 'package:winner_trains_app/view/user_resilience/survey/personal_survey_success.dart';

import 'package:winner_trains_app/view/user_resilience/survey/user-survey/content_preference.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/success_account_creation.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/survey_completion_emotions.dart';
import 'package:winner_trains_app/view/user_resilience/survey/user-survey/user_survey.dart';

import 'package:winner_trains_app/view/user_resilience/userProfile/create_profile.dart';

//Trainer routes

import 'package:winner_trains_app/view/trainer_flow/auth/availability.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/create_profile.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/experience_qualifications.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/forgot_password.dart';
// import 'package:winner_trains_app/view/trainer_flow/auth/view/reset_password.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/sign_up.dart';
import 'package:winner_trains_app/view/trainer_flow/auth/you_specialize_in.dart';
import 'package:winner_trains_app/view/trainer_flow/home/analytics/analytics.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/cancel_booking_reason.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/cancel_details.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/complete_details.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/live_session_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/ongoing_appointment_details.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/unattended_Details.dart';
import 'package:winner_trains_app/view/trainer_flow/home/appointment/upcoming_appointment_details.dart';
import 'package:winner_trains_app/view/trainer_flow/home/comments_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/com_your_stress_related.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/Community_joined.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/create_threads.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/edit_post.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/your_Community.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/community_detail.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/create_communites.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/create_post.dart';
import 'package:winner_trains_app/view/trainer_flow/home/communites/manage_communites.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/resilience_profile.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/see_rating_reviews.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/feedback_form.dart';
import 'package:winner_trains_app/view/trainer_flow/home/my_earning.dart';
import 'package:winner_trains_app/view/trainer_flow/home/notification.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/edit_availability.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/edit_experience_qualification.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/see_experience_qualification_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/edit_profile.dart';
import 'package:winner_trains_app/view/trainer_flow/home/profile/user_profile.dart';
import 'package:winner_trains_app/view/trainer_flow/home/report_issue.dart';
import 'package:winner_trains_app/view/trainer_flow/home/saved_post.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/blocked_user.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/chnage_password.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/setting_Aboute_app.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/setting_privacy_policy.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/setting_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/settings/setting_terms_condition.dart';
import 'package:winner_trains_app/view/trainer_flow/home/story_view.dart';
import 'package:winner_trains_app/view/trainer_flow/home/subscription/my_live_session_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/subscription/set_filter_screen.dart';
import 'package:winner_trains_app/view/trainer_flow/home/subscription/subcription_plans.dart';
import 'package:winner_trains_app/view/trainer_flow/home/subscription/renew_subcription.dart';
import 'package:winner_trains_app/view/trainer_flow/home/trainer_home_view.dart';
import 'package:winner_trains_app/view/user_resilience/userProfile/edit_profile.dart';
import 'package:winner_trains_app/view/user_resilience/userProfile/profile_details.dart';

class Routes {
  static Route<MaterialPageRoute>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case RoutesName.splashScreen:
        return pushTo(const SplashScreen());
      case RoutesName.selectUser:
        return pushTo(const SelectUserScreen());

      case RoutesName.agreement:
        final args = settings.arguments as Map?;
        return pushTo(TermsConditions(
          index: args?['index'],
        ));

      case RoutesName.preLogin:
        return pushTo(const UserPreLogin());

      case RoutesName.logIn:
        return pushTo(UserLoginScreen());

      // case RoutesName.signUp:
      //   return pushTo(SignupScreen());
      case RoutesName.forgetPassword:
        return pushTo(ForgetPassword());
      case RoutesName.resetPassword:
        return pushTo(ResetPassword());

      case RoutesName.createProfile:
        return pushTo(const UserCreateProfile());
      case RoutesName.verificationCode:
        final args = settings.arguments as VerificationFlow;
        return pushTo(
          UserVerificationCode(
            flow: args,
          ),
        );
      case RoutesName.contentPreferences:
        return pushTo(ContentPreference());

      case RoutesName.surveyCompletionEmotions:
        final mode = settings.arguments as EmotionScreenMode;
        return pushTo(SurveyCompletionEmotions(mode: mode));

      case RoutesName.successAccountCreation:
        return pushTo(SuccessAccountCreation());
      case RoutesName.successFeedBack:
        return pushTo(const UserSuccessFeedback());
      case RoutesName.userSurvey:
        return pushTo(UserSurvey());
      case RoutesName.homeScreen:
        return pushTo(UserHomeScreen());
      case RoutesName.bestResilienceTrainer:
        final trainerRoute = settings.arguments as TrainerRoute;
        return pushTo(BestResilienceTrainer(trainerRoute:  trainerRoute));
      case RoutesName.trainerProfile:
        return pushTo(const TrainerProfile());
      case RoutesName.reviews:
        return pushTo(const Reviews());
      case RoutesName.bookingSchedule:
        return pushTo(const Bookingschedule());
      case RoutesName.boookingScheduleDetails:
        return pushTo(const BookingDetails());
      case RoutesName.notifications:
        return pushTo(const Notifications());
      case RoutesName.userCreatePost:
        return pushTo(const UserCreatePost());
      case RoutesName.successPostShared:
        return pushTo(const SuccessPostShared());
      case RoutesName.userReportIssue:
        // final args = settings.arguments as Map<String, dynamic>?;
        // final radioColor = args?['color'] ?? AppColor.lightScheme.secondary;
        return pushTo(const UserReportPostIssue());
      case RoutesName.successReport:
        return pushTo(const SuccessReport());
      case RoutesName.videoReels:
        return pushTo(const VideosReel());
      case RoutesName.settings:
        return pushTo(Settings());
      case RoutesName.changePassword:
        return pushTo(const ChangePassword());
      case RoutesName.aboutApp:
        return pushTo(const AboutApp());
      case RoutesName.termsAndConditions:
        return pushTo(const TermsandConditions());
      case RoutesName.userSavedPost:
        return pushTo(const UserSavedPost());
      case RoutesName.privacyPolicy:
        return pushTo(const PrivacyPolicy());
      case RoutesName.profileDetails:
        return pushTo(const UserProfileDetails());
      case RoutesName.editProfile:
        return pushTo( UserEditProfile());
      case RoutesName.userHelpAndFeedBack:
        return pushTo(const UserHelpAndFeedback());
      case RoutesName.userEditPost:
        return pushTo(const UserEditPost());
      case RoutesName.cancelledAppointment:
        return pushTo(const CancelAppointments());
      case RoutesName.completedAppointment:
        final hasReviewed = settings.arguments as bool? ?? false;
        return pushTo(CompletedAppointments(isReviewed: hasReviewed));

      case RoutesName.unAttendedAppointment:
        return pushTo(const UnattendedAppointments());
      case RoutesName.submitReview:
        return pushTo(const SubmitReview());
      case RoutesName.ongoingAppointments:
        return pushTo(const OngoingAppointments());
      case RoutesName.successReview:
        return pushTo(const SuccessReview());
      case RoutesName.upcomingAppointments:
        return pushTo(const UpcomingAppointments());
      case RoutesName.competenciesView:
        return pushTo(const CompetenciesView());
      case RoutesName.targetFocus:
        return pushTo(const TargetFocusView());
      case RoutesName.enerygyResetPromptView:
        return pushTo(EneryResetPromptView());
      case RoutesName.alignYourGoalsView:
        return pushTo(AlignYourGoals());
      case RoutesName.digDeeperView:
        return pushTo(DigDeeperView());
      case RoutesName.stressSpikeView:
        return pushTo(StressSpikeView());
      case RoutesName.videoView:
        return pushTo(VideoView());
      case RoutesName.brainStormingView:
        return pushTo(BrainStormingView());
      case RoutesName.situationPromptView:
        return pushTo(SituationPromptView());
      case RoutesName.setIntentionView:
        return pushTo(SetYourIntentionView());
      case RoutesName.chooseStrengthView:
        return pushTo(ChooseStrengthView());
      case RoutesName.conversationBuilderView:
        return pushTo(ConversationBuilderView());
      case RoutesName.coreStrengthView:
        return pushTo(CoreStrengthView());
      case RoutesName.strengthApplicationView:
        return pushTo(StrengthApplicationView());
      case RoutesName.clarifyControlView:
        return pushTo(ClarifyControlView());
      case RoutesName.meaningfulSupportView:
        return pushTo(MeaningfulSupportView());
      case RoutesName.actionPlanView:
        return pushTo(ActionPlanView());
      case RoutesName.leadershipScenarioView:
        return pushTo(LeadershipScenarioView());
      case RoutesName.encouragingWordsView:
        return pushTo(EncouragingWordsView());
      case RoutesName.identifyDriverView:
        return pushTo(IdentifyDriverView());
      case RoutesName.impactView:
        return pushTo(ImpactView());
      case RoutesName.celebrateWinView:
        return pushTo(CelebrateWinView());
      case RoutesName.defineProblemView:
        return pushTo(DefineProblemView());
      case RoutesName.triggerReflectionView:
        return pushTo(TriggerReflectionView());
      case RoutesName.flipLensView:
        return pushTo(FlipTheLensView());
      case RoutesName.strategicReframeView:
        return pushTo(StrategicReframe());
      case RoutesName.patternView:
        return pushTo(PatternView());
      case RoutesName.reframeView:
        return pushTo(ReframeView());
      case RoutesName.setbackReflectionView:
        return pushTo(SetbackReflectionView());
      case RoutesName.whatDidYouLearnView:
        return pushTo(WhatDidYouLearnView());
      case RoutesName.rebuildResetView:
        return pushTo(RebuiltResetView());
      case RoutesName.highEnergyMomentsView:
        return pushTo(HighEnergyMoments());
      case RoutesName.identifyStrengthView:
        return pushTo(IdentifyTheStrengthView());
      case RoutesName.breakLoopView:
        return pushTo(BreakTheLoopView());
      case RoutesName.snapshotView:
        return pushTo(SituationSnapshotView());
      case RoutesName.tipView:
        final args = settings.arguments as Map<String, dynamic>;

        return pushTo(TipView(
          description: args["description"],
          height: args["height"],
          flowType: args["flowType"],
        ));
      case RoutesName.reframePromptView:
        return pushTo(ReframePromptView());
      case RoutesName.identifyLoopView:
        return pushTo(IdentifyLoopView());
      case RoutesName.brightSideReflectionView:
        return pushTo(BrightSideReflectionView());
      case RoutesName.stimulusView:
        return pushTo(StimulusView());
      case RoutesName.captureBeliefView:
        return pushTo(CaptureBeliefView());
      case RoutesName.microTraining:
        final microTraining = settings.arguments as MicroTraining;
        return pushTo(MicroTrainingView(
          microTraining: microTraining,
        ));
      case RoutesName.successAppointmentCancel:
        return pushTo(const SuccessAppointmentCancel());
      case RoutesName.cancelAppointmentReason:
        return pushTo(const CancelReason());
      case RoutesName.rescheduleBooking:
        return pushTo(const RescheduleBooking());
      case RoutesName.rescheduleBookingDetails:
        return pushTo(const RescheduleBookingDetails());
      case RoutesName.paymentMethod:
        return pushTo(const PaymentMethod());
      case RoutesName.newCard:
        return pushTo(const AddNewCard());
      case RoutesName.successBookingSchedule:
     
        return pushTo( SuccessScheduleAppointment());
      case RoutesName.successRescheduleAppointment:
        return pushTo(const SuccessRescheduleAppointment());
      case RoutesName.successPersonalSurvey:
        return pushTo(const PersonalSurveySuccess());
      case RoutesName.discoverCommunity:
        return pushTo(const DiscoverCommunity());
      case RoutesName.bookMarkedResilienceTrainer:
        return pushTo(const BookMarkedResilienceTrainer());
      case RoutesName.searchResilienceTrainer:
        return pushTo(const SearchResilienceTrainer());

      // case RoutesName.userSavedPost:
      //   return pushTo(const UserSavedPost());
      case RoutesName.paymentHistory:
        return pushTo(const PaymentHistory());
      case RoutesName.subscription:
        final isLive = settings.arguments as Map<String, dynamic>?;
        return pushTo(SubscriptionScreen(
            isfromLiveSession: isLive?['isfromLiveSession']));

      case RoutesName.successPlanUpgrade:
        final args = settings.arguments as Map<String, dynamic>;

        return pushTo(SuccessUpgradePlan(
          isFromDrawer: args['isFromDrawer'],
        ));
      case RoutesName.liveSession:
        return pushTo(const LiveSession());
      case RoutesName.userJoinLiveSession:
        return pushTo(const UserJoinLiveSession());
      case RoutesName.userCommentsScreen:
        return pushTo(const UserCommentsScreen());
      case RoutesName.ongoingAppointmentReportReasons:
        return pushTo(const OngoingReportAppointments());

      // Trainer Routes

      // case RoutesName.splash:
      //   return MaterialPageRoute(builder: (_) => Splash());
      // case RoutesName.selectUser:
      //   return MaterialPageRoute(builder: (_) => SelectUserScreen());
      case RoutesName.trainerPreLogin:
        return MaterialPageRoute(builder: (_) => const TrainerPreLogin());
      case RoutesName.trainerLogin:
        return MaterialPageRoute(builder: (_) => const TrainerLogin());
      case RoutesName.trainerForgotpassword:
        return MaterialPageRoute(builder: (_) => TrainerForgotPassword());
      case RoutesName.trainerVerification:
        // Extract the arguments as a Map
        final arguments = settings.arguments as Map<String, Object>?;
        final role = arguments?['role'] as String? ?? '';
        final isForgotPassword =
            arguments?['isForgotPassword'] as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => TrainerVerificationCode(
            role: role,
            isForgotPassword: isForgotPassword,
          ),
        );

      case RoutesName.trainerResetPassword:
        return MaterialPageRoute(builder: (_) => TrainerResetPassword());
      case RoutesName.trainerSignup:
        return MaterialPageRoute(builder: (_) => const TrainerSignUp());
      case RoutesName.trainerCreateProfile:
        return MaterialPageRoute(builder: (_) => const TrainerCreateProfile());
      case RoutesName.experiencequalifications:
        return MaterialPageRoute(builder: (_) => ExperienceQualifications());
      case RoutesName.ailability:
        return MaterialPageRoute(builder: (_) => const Availability());
      case RoutesName.youspecializeIn:
        return MaterialPageRoute(builder: (_) => const YouSpecializeIn());
      case RoutesName.trainerprofileverification:
        return MaterialPageRoute(
            builder: (_) => const TrainerProfileVerification());
      case RoutesName.homemain:
        return MaterialPageRoute(builder: (_) => const TrainerHomeView());
      case RoutesName.communitydetail:
        return MaterialPageRoute(builder: (_) => const CommunityDetail());
      case RoutesName.communitesjoined:
        return MaterialPageRoute(builder: (_) => const CommunitesJoined());
      case RoutesName.communitesyour:
        return MaterialPageRoute(builder: (_) => const YourCommunity());
      case RoutesName.comyourrtressrelated:
        return MaterialPageRoute(builder: (_) => const ComYourStressRelated());
      case RoutesName.commentsscreen:
        return MaterialPageRoute(builder: (_) => const CommentsScreen());
      case RoutesName.createpost:
        return MaterialPageRoute(builder: (_) => const CreatePost());
      case RoutesName.createcommunites:
        return MaterialPageRoute(builder: (_) => CreateCommunites());
      case RoutesName.managecommunites:
        return MaterialPageRoute(builder: (_) => ManageCommunites());
      case RoutesName.notification:
        return MaterialPageRoute(builder: (_) => const NotificationPage());
      case RoutesName.createthreads:
        return MaterialPageRoute(builder: (_) => const CreateThreads());
      case RoutesName.userprofile:
        return MaterialPageRoute(builder: (_) => const UserProfile());
      case RoutesName.trainerReportissue:
        return MaterialPageRoute(builder: (_) => const TrainerReportIssue());
      case RoutesName.editpost:
        return MaterialPageRoute(builder: (_) => const EditPost());
      case RoutesName.cancelbookingreason:
        return MaterialPageRoute(builder: (_) => const CancelBookingReason());
      case RoutesName.upcomingappointmentdetails:
        return MaterialPageRoute(
            builder: (_) => const UpcomingAppointmentDetails());
      case RoutesName.livesessionscreen:
        return MaterialPageRoute(builder: (_) => const LiveSessionScreen());
      case RoutesName.ongoingappointemntdetails:
        return MaterialPageRoute(
            builder: (_) => const OngoingAppointmentDetails());
      case RoutesName.canceldetails:
        return MaterialPageRoute(builder: (_) => const CancelDetails());
      case RoutesName.completedetails:
        return MaterialPageRoute(builder: (_) => const CompletedDetails());
      case RoutesName.unattendeddetails:
        return MaterialPageRoute(builder: (_) => const UnattendedDetails());
      case RoutesName.editprofile:
        return MaterialPageRoute(builder: (_) =>  EditProfile());
      case RoutesName.editavailability:
        return MaterialPageRoute(builder: (_) => const EditAvailability());
      case RoutesName.seeexperiencequalification:
        return MaterialPageRoute(
            builder: (_) => const SeeExperienceQualificationScreen());
      case RoutesName.editexperiencequalification:
        return MaterialPageRoute(builder: (_) => EditExperienceQualification());
      case RoutesName.myearning:
        return MaterialPageRoute(builder: (_) => const MyEarning());
      case RoutesName.savedpost:
        return MaterialPageRoute(builder: (_) => const SavedPost());
      case RoutesName.feedbackform:
        return MaterialPageRoute(builder: (_) => FeedbackForm());
      //setting_screen
      case RoutesName.settingscreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case RoutesName.chnagespassword:
        return MaterialPageRoute(builder: (_) => const ChnagePassword());
      case RoutesName.blockeduser:
        return MaterialPageRoute(builder: (_) => BlockedUser());
      case RoutesName.settingtermscadition:
        return MaterialPageRoute(builder: (_) => const SettingTermsCondition());
      case RoutesName.settingPrivacyPolicy:
        return MaterialPageRoute(builder: (_) => const SettingPrivacyPolicy());
      case RoutesName.settingaboutapp:
        return MaterialPageRoute(builder: (_) => const SettingAbouteApp());
      case RoutesName.storyview:
        return MaterialPageRoute(builder: (_) => StoryViewScreen());
      case RoutesName.renewsubscription:
        return MaterialPageRoute(builder: (_) => RenewSubcription());
      case RoutesName.subscriptionplan:
        return MaterialPageRoute(builder: (_) => SubcriptionPlans());
      case RoutesName.setFilterScreen:
        return MaterialPageRoute(builder: (_) => const SetFilterScreen());
      case RoutesName.mylivesessionscreen:
        return MaterialPageRoute(builder: (_) => const MyLiveSessionScreen());
      case RoutesName.seeratingreviews:
        return MaterialPageRoute(builder: (_) => const SeeRatingReviews());
      case RoutesName.analytics:
        return MaterialPageRoute(builder: (_) => const Analytics());
      case RoutesName.resilienceprofile:
        return MaterialPageRoute(builder: (_) => const ResilienceProfile());
      case RoutesName.trainerreportsubmittes:
        return MaterialPageRoute(
            builder: (_) => const TrainerReportSubmittes());
      case RoutesName.trainerfeedbacksubmitted:
        return MaterialPageRoute(
            builder: (_) => const TrainerFeedbackSubmitted());
      case RoutesName.trainercancelappointment:
        return MaterialPageRoute(
            builder: (_) => const TrainerCancelAppointment());
      case RoutesName.trainerappointmentreportissue:
        return MaterialPageRoute(
            builder: (_) => const TrainerAppointmentReportIssue());
      case RoutesName.trainerongoingappointmentreport:
        return MaterialPageRoute(
            builder: (_) => const TrainerOngoingAppointmentReport());

      default:
        return pushTo(
          const Scaffold(
            body: Center(child: Text("No Route Defined")),
          ),
        );
    }
  }

  static Route<MaterialPageRoute<dynamic>>? pushTo(Widget screen) =>
      MaterialPageRoute(
        builder: (context) => screen,
      );
}
