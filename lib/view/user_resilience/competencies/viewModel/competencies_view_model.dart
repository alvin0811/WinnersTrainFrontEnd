import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/model/competencies_model.dart';

class CompetenciesViewModel extends ChangeNotifier {
  final List<Map<String, String>> competencies = [
    {
      "icon": "assets/icons/target-focus.png",
      "title": "Target Focus",
      "description":
          "Sharpen awareness of your thoughts, feelings, and reactions—so you can understand what drives your actions and stay locked in on your goals."
    },
    {
      "icon": "assets/icons/bright-side.png",
      "title": "Spot the Bright Side",
      "description":
          "Train your brain to focus on the good—even in tough moments. Build optimism by noticing progress, opportunity, and growth."
    },
    {
      "icon": "assets/icons/stimulate-event.png",
      "title": "Stimulate Event → Belief → Impact",
      "description":
          "Understand how your interpretation of an event—not the event itself—shapes your feelings and behavior. This clarity fuels smarter reactions."
    },
    {
      "icon": "assets/icons/mental-loop.png",
      "title": "Break Mental Loops",
      "description":
          "Catch yourself in unhelpful thinking patterns (like jumping to conclusions or overgeneralizing), and break free with healthier thought habits."
    },
    {
      "icon": "assets/icons/deep-drivers.png",
      "title": "Uncover Deep Drivers",
      "description":
          "Explore the “icebergs”—those deep, often hidden beliefs that shape your emotional world. Gaining awareness here boosts self-control and insight."
    },
    {
      "icon": "assets/icons/problem-solving.png",
      "title": "Problem Resolving – Strategic Fixing",
      "description":
          "Tackle challenges with a step-by-step mindset. Learn to frame problems clearly, brainstorm options, and take decisive action."
    },
    {
      "icon": "assets/icons/spiral.png",
      "title": "Calm the Spiral",
      "description":
          "Stop stress from spiraling by managing energy, using breathing tools, and staying centered in high-pressure moments."
    },
    {
      "icon": "assets/icons/strategic-thinking.png",
      "title": "Strategic Thinking / Mind Flex",
      "description":
          "Think with flexibility. Adjust your perspective, challenge assumptions, and stay mentally sharp in fast-changing scenarios."
    },
    {
      "icon": "assets/icons/bounce-back.png",
      "title": "Bounce Back Fast",
      "description":
          "Resilience isn’t about never failing—it’s about how fast you bounce back. Build grit by learning from setbacks and moving forward stronger."
    },
    {
      "icon": "assets/icons/spot-strengths.png",
      "title": "Spot Natural Strengths",
      "description":
          "Discover what energizes and grounds you. Honing your natural strengths builds confidence and resilience, especially under stress."
    },
    {
      "icon": "assets/icons/lead-with-strengths.png",
      "title": "Lead with Strengths",
      "description":
          "Use your best qualities to lead yourself—and others. Strengths create trust and motivate others when directed into powerful influence."
    },
    {
      "icon": "assets/icons/speak-with-strength.png",
      "title": "Speak with Strength",
      "description":
          "Communicate with confidence. Give and receive feedback in ways that lift others up and help you grow stronger relationships."
    },
    {
      "icon": "assets/icons/lift-others-up.png",
      "title": "Lift Others Up",
      "description":
          "Be a force for good. Celebrate wins, offer real support, and create a culture of encouragement and emotional connection."
    }
  ];


  final List<CompetenciesModel> competencyDetails = [
    CompetenciesModel(
      nextRoute: RoutesName.surveyCompletionEmotions,
        icon: "assets/images/target.png",
        title: "Target Focus",
        subtitle: "Sharpen Your Mind. Stay Goal-Focused.",
        description:
            "Sharpen awareness of your thoughts, feelings, and reactions—so you can understand what drives your actions and stay locked in on your goals."),
    CompetenciesModel(
        nextRoute: RoutesName.situationPromptView,
        icon: "assets/images/spot.png",
        title: "Spot the Bright Side",
        subtitle: "Your mindset changes your experience.",
        description:
            "Train your brain to focus on the good—even in tough moments. Build optimism by noticing progress, opportunity, and growth."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/stimulate.png",
        title: "Stimulate Event → Belief → Impact",
        subtitle: "Your mindset changes your experience.",
        description:
            "Understand how your interpretation of an event—not the event itself—shapes your feelings and behavior. This clarity fuels smarter reactions."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/loop.png",
        title: "Break Mental Loops",
        subtitle: "Repetitive thoughts that drain your energy.",
        description:
            "Mental loops are thought patterns that keep repeating and drain your energy.This tool helps you recognize, interrupt, and refocus."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/uncover.png",
        title: "Uncover Deep Drivers",
        subtitle: "Repetitive thoughts that drain your energy.",
        description:
            "We all have hidden beliefs and values shaping how we think, feel, and act.This tool helps you discover them so your decisions reflect who you really are."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/problem.png",
        title: "Problem Resolving –Strategic Fixing",
        subtitle: "Solve smart define, brainstorm, and act.",
        description:
            "When you break down a problem, it gets easier to solve.This tool walks you through a process to move from stuck to solution."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/spiral.png",
        title: "Calm the Spiral",
        subtitle: "Stay Calm Under Pressure",
        description:
            "Stress can build fast and spin out of control.This tool helps you pause, reset, and return to balance."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/strategic.png",
        title: "Strategic Thinking / Mind Flex",
        subtitle: "Stay Flexible and Sharp.",
        description:
            "In a fast-moving world, rigid thinking breaks. Flexible minds win.This tool helps you reframe, pivot, and think ahead."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/bounce.png",
        title: "Bounce Back Fast",
        subtitle: "The Power of Bouncing Back.",
        description:
            "Everyone falls. Resilience is how fast you get back up.This tool helps you recover with purpose and strength."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/natural.png",
        title: "Spot Natural Strengths",
        subtitle: "Find Your Inner Strength.",
        description:
            "Your strengths are your power.This tool helps you identify and use what makes you thrive."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/lead.png",
        title: "Lead with Strengths",
        subtitle: "Leadership Rooted in Strength",
        description:
            "Great leaders know and use their strengths.Start by leading yourself with clarity and purpose."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/speak.png",
        title: "Speak with Strength",
        subtitle: "Powerful Words, Strong Impact",
        description:
            "Words have power. Use them to build up, connect, and grow.This tool guides you to communicate with purpose and strength."),
    CompetenciesModel(
        nextRoute: '',
        icon: "assets/images/lifting_others.png",
        title: "Lift Others Up",
        subtitle: "Build Resilience Through Connection",
        description:
            "Resilience grows in connection.This tool helps you strengthen your team, friends, or community—one uplifting moment at a time."),
   
  ];

  // For multi-option toggle
  String? selectedOption;
  String? otherText;

  void selectOption(String option, [String? other]) {
    selectedOption = option;
    otherText = other;
    notifyListeners();
  }

  // For dual toggle
  String? selectedDualOption;

  void selectDualOption(String option) {
    selectedDualOption = option;
    notifyListeners();
  }
}
