import 'package:flutter/widgets.dart';

class CustomWidgetShaker extends StatefulWidget {
  final Widget child;
  final double power;

  CustomWidgetShaker({@required this.child, double power = 1.0})
      : this.power = power;

  @override
  _CustomWidgetShakerState createState() => _CustomWidgetShakerState();
}

class _CustomWidgetShakerState extends State<CustomWidgetShaker>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _animationController = AnimationController(
        duration: Duration(milliseconds: widget.power > 1 ? 200 : 250),
        vsync: this,
      );
      _animationController.reverse(from: 1.0);
      _animationController.addListener(() {
        setState(() {});
      });

      _animationController.repeat(reverse: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1 - (widget.power * (_animationController?.value ?? 1) / 50),
      child: Container(
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
