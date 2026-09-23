import '/custom_code/widgets/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'empty_state_model.dart';
export 'empty_state_model.dart';

class EmptyStateWidget extends StatefulWidget {
  const EmptyStateWidget({
    super.key,
    this.title,
    this.subtitle,
    this.buttonText,
    this.icon,
    this.iconColor,
    this.action,
  });

  final String? title;
  final String? subtitle;
  final String? buttonText;
  final Widget? icon;
  final Color? iconColor;
  final Future Function()? action;

  @override
  State<EmptyStateWidget> createState() => _EmptyStateWidgetState();
}

class _EmptyStateWidgetState extends State<EmptyStateWidget> {
  late EmptyStateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmptyStateModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(EmptyState(
      width: double.infinity,
      title: widget.title,
      subtitle: widget.subtitle,
      buttonText: widget.buttonText,
      icon: widget.icon,
      iconColor: widget.iconColor,
      onButtonTap: widget.action,
    ));
  }
}
