import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qr_care/core/app_color.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  _LoadingWidgetState createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
  }

  @override
  Widget build(BuildContext context) {
    final spinkit = SpinKitSquareCircle(
      color: AppColors.mainColor,
      size: 50.0,
      controller: _controller,
    );

    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Builder(
            builder: (context) => spinkit,
          ),
        ),
        const Positioned.fill(child: Center(child: WorkSpace())),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class WorkSpace extends StatelessWidget {
  const WorkSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
    );
  }
}
