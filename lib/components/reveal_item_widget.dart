import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'reveal_item_model.dart';
export 'reveal_item_model.dart';

class RevealItemWidget extends StatefulWidget {
  const RevealItemWidget({
    super.key,
    this.selected,
    this.icon,
    this.title,
    this.value,
  });

  final bool? selected;
  final Widget? icon;
  final String? title;
  final String? value;

  @override
  State<RevealItemWidget> createState() => _RevealItemWidgetState();
}

class _RevealItemWidgetState extends State<RevealItemWidget> {
  late RevealItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RevealItemModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return genzFade(Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(24.0),
          border: Border.all(
            color: widget.selected!
                ? FlutterFlowTheme.of(context).primary
                : FlutterFlowTheme.of(context).divider,
            width: 1.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                decoration: BoxDecoration(
                  color: widget.selected!
                      ? FlutterFlowTheme.of(context).primaryBackground
                      : FlutterFlowTheme.of(context).divider,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: widget.icon!,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        widget.title,
                        'Profile Photo',
                      ),
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                            font: GoogleFonts.plusJakartaSans(
                              fontWeight: FontWeight.w600,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .labelLarge
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 15.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .fontStyle,
                            lineHeight: 1.3,
                          ),
                    ),
                    Text(
                      valueOrDefault<String>(
                        widget.value,
                        'Your high-quality main photo',
                      ),
                      maxLines: 1,
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            font: GoogleFonts.spaceGrotesk(
                              fontWeight: FontWeight.normal,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .fontStyle,
                            ),
                            color: FlutterFlowTheme.of(context).secondaryText,
                            fontSize: 13.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .fontStyle,
                            lineHeight: 1.4,
                          ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ].divide(const SizedBox(height: 4.0)),
                ),
              ),
              Container(
                width: 24.0,
                height: 24.0,
                decoration: BoxDecoration(
                  color: widget.selected!
                      ? FlutterFlowTheme.of(context).primary
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(9999.0),
                  border: Border.all(
                    color: widget.selected!
                        ? FlutterFlowTheme.of(context).primary
                        : FlutterFlowTheme.of(context).hint,
                    width: 2.0,
                  ),
                ),
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Icon(
                  Icons.check_rounded,
                  color: FlutterFlowTheme.of(context).primaryBackground,
                  size: 16.0,
                ),
              ),
            ].divide(const SizedBox(width: 16.0)),
          ),
        ),
      ),
    ));
  }
}
