import 'package:flutter/material.dart';
import 'package:winner_trains_app/utils/routes/route_name.dart';

class SubscriptionState {
  final bool isLoading;
  final String liveText;
  final int counter;

  SubscriptionState._({
    required this.isLoading,
    required this.liveText,
    required this.counter,
  });

  factory SubscriptionState.initial() => SubscriptionState._(
        isLoading: false,
        liveText: '',
        counter: 0,
      );

  factory SubscriptionState.loading() => SubscriptionState._(
        isLoading: true,
        liveText: '',
        counter: 3,
      );

  factory SubscriptionState.live(String text) => SubscriptionState._(
        isLoading: false,
        liveText: text,
        counter: 0,
      );

  SubscriptionState copyWith({
    bool? isLoading,
    String? liveText,
    int? counter,
  }) {
    return SubscriptionState._(
      isLoading: isLoading ?? this.isLoading,
      liveText: liveText ?? this.liveText,
      counter: counter ?? this.counter,
    );
  }
}

class SubscriptionViewModel extends ValueNotifier<SubscriptionState> {
  SubscriptionViewModel() : super(SubscriptionState.initial());

  void startLoading(BuildContext context) async {
    value = SubscriptionState.loading();

    for (int i = 3; i >= 1; i--) {
      await Future.delayed(const Duration(seconds: 1));
      value = value.copyWith(counter: i);
    }

    value = SubscriptionState.live("You are now live!");

    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushNamed(context, RoutesName.mylivesessionscreen);
  }
}
