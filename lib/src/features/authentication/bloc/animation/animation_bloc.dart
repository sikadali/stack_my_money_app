import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

part 'animation_event.dart';

part 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  AnimationBloc() : super(InitialState()) {
    on<AnimateSplashScreen>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      emit(SplashScreenAnimationComplete());
    });
  }
}
