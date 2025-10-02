import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/viewModel/competencies_view_model.dart';
import 'package:winner_trains_app/viewModel/user_view_models/help_and_feedback_view_model.dart';
import 'package:winner_trains_app/viewModel/user_view_models/home_view_model.dart';
import 'package:winner_trains_app/viewModel/user_view_models/community_viewmodel.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/auth_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/analytics_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/appointment_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/button_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/comment_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/communites_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/help_feedback_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/home_card_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/profile_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/saved_post_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/story_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/subcription_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/trainer_main_home_view_model.dart';
import 'package:winner_trains_app/viewModel/trainer_view_models/vedeo_player_view_model.dart';


void main() async {
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // User Flow
        ChangeNotifierProvider(create: (context) => AppointmentViewModel()),
        ChangeNotifierProvider(create: (context) => HelpAndFeedbackViewModel()),
        ChangeNotifierProvider(create: (context) => UserHomeViewModel()),
        ChangeNotifierProvider(create: (context) => CommunityViewModel()),
          ChangeNotifierProvider(create: (context) => CompetenciesViewModel()),
        // Trainer Flow
        ChangeNotifierProvider(create: (_) => TrainerMainHomeViewModel()),
        ChangeNotifierProvider(create: (_) => CommunitesCardViewModel()..initializeData()),
        ChangeNotifierProvider(create: (_) => AppointmentCardViewModel()),
        ChangeNotifierProvider(create: (_) => HomeCardViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CommentViewModel()),
        ChangeNotifierProvider(create: (_) => ProfileViewModel()),
        ChangeNotifierProvider(create: (_) => VideoPlayerProvider()),
        ChangeNotifierProvider(create: (_) => SavedPostViewModel()),
        ChangeNotifierProvider(create: (_) => FeedbackProvider()),
        ChangeNotifierProvider(create: (_) => SubscriptionViewModel()),
        ChangeNotifierProvider(create: (_) => StoryViewModel()),
        ChangeNotifierProvider(create: (_) => AnalyticsViewModel()),
        ChangeNotifierProvider(create: (_) => ButtonViewModel())
      ],
      child: ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        ensureScreenSize: true,
      
        builder: (_, c) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(
             textScaler: const TextScaler.linear(1.0)
            ),
            child: MaterialApp(
              theme: AppTheme.themeData,
              onGenerateRoute: (settings) => Routes.onGenerateRoute(settings),
              initialRoute: RoutesName.splashScreen,
              debugShowCheckedModeBanner: false,
            ),
          );
        }
      ),
    );
  }
}

