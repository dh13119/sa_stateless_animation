part of sa_stateless_animation;

/// Widget that creates and plays an animation endlessly from
/// the start to the end.
///
/// You need to specify a [tween] that describes your animation
/// and [builder] function that is called each frame you are
/// animating. This function has signature of [AnimatedWidgetBuilder].
///
/// It's also useful to specify a [duration] (default is 1 second).
///
/// To improve the performance of your animation you should put
/// all widgets that are not effected by the animation into the [child]
/// property. You get that child widget passed into the [builder]
/// function. See also [AnimatedWidgetBuilder].
///
/// The [curve] parameter can be used to apply a non-linear animation
/// to your tween.
///
/// If you work with multiple animation widgets that are conditionally
/// rendered, you might want to set a [key]. Otherwise Flutter will
/// recycled your "old animation" which results in strange behavior.
class LoopAnimation<T> extends StatelessWidget {
  final AnimatedWidgetBuilder<T> builder;
  final Widget child;
  final Duration duration;
  final Animatable<T> tween;
  final Curve curve;

  /// Creates a new LoopAnimation widget.
  /// See class documentation for more information.
  LoopAnimation(
      {@required this.builder,
      @required this.tween,
      this.duration = const Duration(seconds: 1),
      this.curve = Curves.linear,
      this.child,
      Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimation<T>(
      builder: builder,
      control: CustomAnimationControl.LOOP,
      tween: tween,
      duration: duration,
      curve: curve,
      child: child,
    );
  }
}
