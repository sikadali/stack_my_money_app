part of 'animation_bloc.dart';

@immutable
sealed class AnimationState {}

class InitialState extends AnimationState {}

class SplashScreenAnimationComplete extends AnimationState {}
