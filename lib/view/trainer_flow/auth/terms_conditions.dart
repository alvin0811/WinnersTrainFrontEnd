import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:flutter_markdown/flutter_markdown.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:winner_trains_app/utils/app_text_style.dart';

class TermsConditions extends StatefulWidget {
  final int index;
  const TermsConditions({super.key, required this.index});

  @override
  _TermsConditionState createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsConditions> {
  late Future<String> termsConditionFuture;
  late Future<String> privacyPolicyFuture;

  @override
  void initState() {
    super.initState();
    termsConditionFuture = _getTermsCondition();
    privacyPolicyFuture = _getPrivacyPolicy();
  }

  Future<String> _getTermsCondition() async {
    await Future.delayed(Duration(seconds: 2));
    return _tremText();
  }

  Future<String> _getPrivacyPolicy() async {
    await Future.delayed(Duration(seconds: 2));
    return _tremText();
  }

  String _tremText() {
    return '''# 
    This is the Privacy Policy of the app. Your privacy is important to us. We are committed to protecting your personal data.

    ## Data Collection
    - We collect data such as your name, email, and usage patterns to improve the user experience.

    ## Data Protection
    - We use encryption to protect your personal data and ensure that it is not shared with third parties without your consent.

    ## Data Sharing
    - We do not share your data with any third parties unless required by law. Your data will only be used to enhance your experience on our platform.

    ## Cookies
    - This app uses cookies to remember your preferences and provide a more personalized experience.

    # Terms and Conditions
    These are the Terms and Conditions of the app. Please read carefully. You agree to these terms when you use this app.

    ## Condition 1
    - Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus lacinia odio vitae vestibulum.

    ## Condition 2
    - Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra.

    ## Condition 3
    - Nam commodo suscipit quam. Integer malesuada, nisi a bibendum condimentum, odio eros consequat felis.
    ''';
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * 0.914;

    return DefaultTabController(
      initialIndex: widget.index,
      length: 2,
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset(
                "assets/images/back.png",
                width: 40.w,
                height: 40.h,
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Agreement",
                style: AppTextStyle.button(
                  fontWeight: FontWeight.bold,
                )),
            centerTitle: true,
          ),
          body: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: containerHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0.r),
                  topRight: Radius.circular(20.0.r),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    TabBar(
                      dividerHeight: 4,
                      indicatorColor: Color(0xff008B88),
                      indicatorSize: TabBarIndicatorSize.label,
                      labelPadding: const EdgeInsets.symmetric(
                        horizontal: 0.1,
                      ),
                      labelStyle: TextStyle(
                        color: Color(0xff121314),
                        fontSize: 18.sp, // Increased text size
                        fontWeight: FontWeight.bold,
                      ),
                      unselectedLabelStyle: AppTextStyle.button(
                        color: Color(0xff4C5157),
                      ),
                      tabs: [
                        Tab(
                          child: TabBarLabel(
                            text: "Privacy Policy",
                          ),
                        ),
                        Tab(
                          child: TabBarLabel(
                            text: "Terms & Conditions",
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Expanded(
                      child: TabBarView(
                        clipBehavior: Clip.none,
                        children: [
                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: Color(0xffFFFFFF),
                          //     border: Border.all(color: Color(0xff1213141A)),
                          //     borderRadius: BorderRadius.circular(15.r),
                          //   ),
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: FutureBuilder<String>(
                          //     future: privacyPolicyFuture,
                          //     builder: (context, snapshot) {
                          //       if (snapshot.connectionState == ConnectionState.waiting) {
                          //         return Center(child: CircularProgressIndicator());
                          //       } else if (snapshot.hasError) {
                          //         return Center(child: Text('Error: ${snapshot.error}'));
                          //       } else {
                          //         return Markdown(
                          //           data: snapshot.data ?? "",
                          //           styleSheet: MarkdownStyleSheet.fromTheme(
                          //             Theme.of(context).copyWith(cardColor: Colors.transparent,
                          //               textTheme: TextTheme(
                          //                 bodyMedium: TextStyle(fontSize: 18.sp), // Larger text size
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            width: 390.w,
                            child: Card(
                              color: Colors.white,
                              elevation: 5,
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.vertical,
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            maxLines: 8,
                                            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                                            style: AppTextStyle.body(
                                              color: Color(0xff4C5157),
                                            )),
                                        10.verticalSpace,
                                        Text(
                                            maxLines: 8,
                                            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                                            style: AppTextStyle.body(
                                              color: Color(0xff4C5157),
                                            ))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),

                          SizedBox(
                            width: 390.w,
                            child: Card(
                              color: Colors.white,
                              elevation: 5,
                              child: ListView.builder(
                                itemCount: 4,
                                scrollDirection: Axis.vertical,
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                            maxLines: 8,
                                            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                                            style: AppTextStyle.body(
                                                color: Color(0xff4C5157),
                                                fontWeight: FontWeight.w400)),
                                        10.verticalSpace,
                                        Text(
                                            maxLines: 8,
                                            "Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Egestas tortor blandit vestibulum tempus dignissim cras placerat, ligula ridiculus sollicitudin interdum quisque facilisis, suscipit tempor justo tristique et mattis. Nisl imperdiet donec nascetur feugiat massa vehicula elementum nullam purus morbi, sagittis et penatibus taciti vitae lobortis facilisis maecenas gravida, venenatis sed pellentesque suspendisse sociis magna class nibh volutpat. Sodales leo arcu ornare eget torquent dictumst, id morbi fringilla ultricies suscipit, nulla sapien a aliquet tempor. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam. Lorem ipsum dolor sit amet consectetur adipiscing elit odio, mattis quam tortor taciti aenean luctus nullam enim, dui praesent ad dapibus tempus natoque a. Rhoncus praesent massa torquent malesuada maecenas arcu curae, porta pulvinar potenti at mus sem, vel purus proin eleifend nisi dictum. Tristique non eros a felis quam convallis nascetur montes auctor hendrerit, mollis metus sodales ligula magnis condimentum et arcu nam.",
                                            style: AppTextStyle.body(
                                                color: Color(0xff4C5157),
                                                fontWeight: FontWeight.w400))
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          )
                          // Container(
                          //   padding: const EdgeInsets.all(8.0),
                          //   decoration: BoxDecoration(
                          //     color: Color(0xffFFFFFF),
                          //     border: Border.all(color: Color(0xff1213141A)),
                          //     borderRadius: BorderRadius.circular(15.r),
                          //   ),
                          //   child: FutureBuilder<String>(
                          //     future: termsConditionFuture,
                          //     builder: (context, snapshot) {
                          //       if (snapshot.connectionState ==
                          //           ConnectionState.waiting) {
                          //         return Center(
                          //             child: CircularProgressIndicator());
                          //       } else if (snapshot.hasError) {
                          //         return Center(
                          //             child: Text('Error: ${snapshot.error}'));
                          //       } else {
                          //         return Markdown(
                          //           data: snapshot.data ?? "",
                          //           styleSheet: MarkdownStyleSheet.fromTheme(
                          //             Theme.of(context).copyWith(
                          //               cardColor: Colors.transparent,
                          //               textTheme: TextTheme(
                          //                 bodyMedium: TextStyle(
                          //                     fontSize:
                          //                         18.sp), // Larger text size
                          //               ),
                          //             ),
                          //           ),
                          //         );
                          //       }
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TabBarLabel extends StatelessWidget {
  final String text;

  const TabBarLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: DefaultTextStyle.of(context).style.copyWith(
              fontWeight: FontWeight.w900,
            ),
      ),
    );
  }
}
