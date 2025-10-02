import 'package:winner_trains_app/utils/basic_exports.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/viewModel/competencies_view_model.dart';
import 'package:winner_trains_app/view/user_resilience/competencies/views/competencies_details_view.dart' show CompetenciesDetailsView;
import 'package:winner_trains_app/view/user_resilience/competencies/widgets/competencies_widget.dart';
import 'package:winner_trains_app/view/widgets/custom_appbar.dart';
import 'package:winner_trains_app/view/widgets/custom_background.dart';

class CompetenciesView extends StatelessWidget {
  const CompetenciesView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CompetenciesViewModel>(context, listen: false);
    return CustomBackground(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: const CustomAppBar(
        title: "Competencies",
      ),
      body: SafeArea(
        top: false,
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: vm.competencies.length,
            shrinkWrap: true,
            padding:
                EdgeInsets.only(right: 20.w, left: 20.w, top: 10, bottom: 20.h),
            itemBuilder: (context, index) {
              final item = vm.competencies[index];
              return GestureDetector(
                onTap: () {
             Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CompetenciesDetailsView(
                        competency: vm.competencyDetails[index],
                        index: index, // 👈 pass index along
                      ),
                    ),
                  );
                },
                child: CompetenciesWidget(
                  image: item["icon"] as String,
                  title: item["title"] as String,
                  desc: item["description"] as String,
                ),
              );
            }),
      ),
    ));
  }
}
