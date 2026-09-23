import '/auth/firebase_auth/auth_util.dart';
import '/backend/razorpay/razorpay_payment_sheet.dart';
import '/components/coin_pack_widget.dart';
import '/components/pop_up_confirm_widget.dart';
import '/components/pop_up_navigate_widget.dart';
import '/components/task_item_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'coin_shop_model.dart';
export 'coin_shop_model.dart';

class CoinShopWidget extends StatefulWidget {
  const CoinShopWidget({super.key});

  static String routeName = 'CoinShop';
  static String routePath = '/coinShop';

  @override
  State<CoinShopWidget> createState() => _CoinShopWidgetState();
}

class _CoinShopWidgetState extends State<CoinShopWidget> {
  late CoinShopModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoinShopModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return genzPage(Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          primary: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding:
                    const EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 15.0, 0.0),
                child: Stack(
                  children: [
                    Align(
                      alignment: const AlignmentDirectional(0.0, 0.0),
                      child: ClipRRect(
                        child: Container(
                          height: 240.0,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                FlutterFlowTheme.of(context).primary,
                                FlutterFlowTheme.of(context).secondary
                              ],
                              stops: const [0.0, 1.0],
                              begin: const AlignmentDirectional(1.0, 1.0),
                              end: const AlignmentDirectional(-1.0, -1.0),
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment:
                                    const AlignmentDirectional(-1.5, -1.2),
                                child: Container(
                                  width: 200.0,
                                  height: 200.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x1AFFFFFF),
                                    borderRadius: BorderRadius.circular(9999.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(1.8, 0.5),
                                child: Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    color: const Color(0x2600F5FF),
                                    borderRadius: BorderRadius.circular(9999.0),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Coin Shop',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.bold,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMedium
                                                      .fontStyle,
                                            ),
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            fontSize: 28.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .headlineMedium
                                                    .fontStyle,
                                            lineHeight: 1.2,
                                          ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0x4D000000),
                                        borderRadius:
                                            BorderRadius.circular(9999.0),
                                        border: Border.all(
                                          color: const Color(0x33FFFFFF),
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(24.0, 8.0, 24.0, 8.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.coins,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .warning,
                                              size: 24.0,
                                            ),
                                            Text(
                                              FFAppState().coins.toString(),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleLarge
                                                  .override(
                                                    font: GoogleFonts
                                                        .plusJakartaSans(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleLarge
                                                              .fontStyle,
                                                    ),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 22.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.bold,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleLarge
                                                            .fontStyle,
                                                    lineHeight: 1.3,
                                                  ),
                                            ),
                                          ].divide(const SizedBox(width: 8.0)),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Current Balance',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            font: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w600,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                            color: const Color(0xB3FFFFFF),
                                            fontSize: 13.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelMedium
                                                    .fontStyle,
                                            lineHeight: 1.3,
                                          ),
                                    ),
                                  ].divide(const SizedBox(height: 8.0)),
                                ),
                              ),
                              InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.safePop();
                                },
                                child: Icon(
                                  Icons.keyboard_arrow_left,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  size: 32.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Unlock Premium Features',
                          style: FlutterFlowTheme.of(context)
                              .titleLarge
                              .override(
                                font: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleLarge
                                      .fontStyle,
                                ),
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .fontStyle,
                                lineHeight: 1.3,
                              ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selected = 1;
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const PopUpConfirmWidget(
                                            headLine: 'Proceed to Buy?',
                                            message:
                                                'You are being redirected to our payment gateway provider to complete the transaction',
                                            confirmTxt: 'Proceed',
                                            cancel: 'Close',
                                          ),
                                        );
                                      },
                                    );
                                    if (!context.mounted) return;
                                    if (FFAppState().confirm == true) {
                                      await processRazorpayPayment(
                                        context,
                                        amount: 8900,
                                        currency: 'INR',
                                        receipt: (String var1, String var2) {
                                          return "${var2}_$var1";
                                        }(
                                            dateTimeFormat(
                                                "d/M/y", getCurrentTimestamp),
                                            currentUserReference!.id),
                                        description:
                                            '${currentUserReference?.id}-coinsPack',
                                        userName: currentUserDocument!
                                            .realId.fullName,
                                        userEmail: currentUserEmail,
                                        userContact: currentPhoneNumber,
                                        dialogColor: '#00000000',
                                        processingColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        errorColor:
                                            FlutterFlowTheme.of(context).error,
                                        successColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        onReceivedResponse: (paymentId) =>
                                            safeSetState(() =>
                                                _model.razorpayPaymentId1 =
                                                    paymentId),
                                      );
                                      if (!context.mounted) return;
                                      if (_model.razorpayPaymentId1 != null &&
                                          _model.razorpayPaymentId1 != '') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: const PopUpNavigateWidget(
                                                headLine: 'Success 🎉',
                                                message:
                                                    'Your purchase is successful. Coins will be added soon.',
                                                confirmTxt: 'Close',
                                                pageName: 'back',
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Due to technical Issue, your request may not be procesed at this moment.',
                                              style: GoogleFonts.robotoFlex(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.coinPackModel1,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CoinPackWidget(
                                      price: '89/-',
                                      isHot: true,
                                      coins: 10,
                                      isSelected: _model.selected == 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selected = 2;
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const PopUpConfirmWidget(
                                            headLine: 'Proceed to Buy?',
                                            message:
                                                'You will be redirected to our payment gateway provider to complete the transaction',
                                            confirmTxt: 'Proceed',
                                            cancel: 'Close',
                                          ),
                                        );
                                      },
                                    );
                                    if (!context.mounted) return;
                                    if (FFAppState().confirm == true) {
                                      await processRazorpayPayment(
                                        context,
                                        amount: 16900,
                                        currency: 'INR',
                                        receipt: (String var1, String var2) {
                                          return "${var2}_$var1";
                                        }(
                                            dateTimeFormat(
                                                "d/M/y", getCurrentTimestamp),
                                            currentUserReference!.id),
                                        description:
                                            '${currentUserReference?.id}-coinsPack',
                                        userName: currentUserDocument!
                                            .realId.fullName,
                                        userEmail: currentUserEmail,
                                        userContact: currentPhoneNumber,
                                        dialogColor: '#00000000',
                                        processingColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        errorColor:
                                            FlutterFlowTheme.of(context).error,
                                        successColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        onReceivedResponse: (paymentId) =>
                                            safeSetState(() =>
                                                _model.razorpayPaymentId2 =
                                                    paymentId),
                                      );
                                      if (!context.mounted) return;
                                      if (_model.razorpayPaymentId2 != null &&
                                          _model.razorpayPaymentId2 != '') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: const PopUpNavigateWidget(
                                                headLine: 'Success 🎉',
                                                message:
                                                    'Your purchase is successful. Coins will be added soon.',
                                                confirmTxt: 'Close',
                                                pageName: 'back',
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Due to technical Issue, your request may not be procesed at this moment.',
                                              style: GoogleFonts.robotoFlex(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.coinPackModel2,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CoinPackWidget(
                                      price: '169/-',
                                      isHot: false,
                                      coins: 20,
                                      isSelected: _model.selected == 2,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selected = 3;
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const PopUpConfirmWidget(
                                            headLine: 'Proceed to Buy?',
                                            message:
                                                'You will be redirected to our payment gateway provider to complete the transaction',
                                            confirmTxt: 'Proceed',
                                            cancel: 'Close',
                                          ),
                                        );
                                      },
                                    );
                                    if (!context.mounted) return;
                                    if (FFAppState().confirm == true) {
                                      await processRazorpayPayment(
                                        context,
                                        amount: 39900,
                                        currency: 'INR',
                                        receipt: (String var1, String var2) {
                                          return "${var2}_$var1";
                                        }(
                                            dateTimeFormat(
                                                "d/M/y", getCurrentTimestamp),
                                            currentUserReference!.id),
                                        description:
                                            '${currentUserReference?.id}-coinsPack',
                                        userName: currentUserDocument!
                                            .realId.fullName,
                                        userEmail: currentUserEmail,
                                        userContact: currentPhoneNumber,
                                        dialogColor: '#00000000',
                                        processingColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        errorColor:
                                            FlutterFlowTheme.of(context).error,
                                        successColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        onReceivedResponse: (paymentId) =>
                                            safeSetState(() =>
                                                _model.razorpayPaymentId3 =
                                                    paymentId),
                                      );
                                      if (!context.mounted) return;
                                      if (_model.razorpayPaymentId3 != null &&
                                          _model.razorpayPaymentId3 != '') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: const PopUpNavigateWidget(
                                                headLine: 'Success 🎉',
                                                message:
                                                    'Your purchase is successful. Coins will be added soon.',
                                                confirmTxt: 'Close',
                                                pageName: 'back',
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Due to technical Issue, your request may not be procesed at this moment.',
                                              style: GoogleFonts.robotoFlex(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.coinPackModel3,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CoinPackWidget(
                                      price: '399/-',
                                      isHot: false,
                                      coins: 50,
                                      isSelected: _model.selected == 3,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Builder(
                                builder: (context) => InkWell(
                                  splashColor: Colors.transparent,
                                  focusColor: Colors.transparent,
                                  hoverColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                  onTap: () async {
                                    _model.selected = 4;
                                    safeSetState(() {});
                                    await showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return Dialog(
                                          elevation: 0,
                                          insetPadding: EdgeInsets.zero,
                                          backgroundColor: Colors.transparent,
                                          alignment: const AlignmentDirectional(
                                                  0.0, 0.0)
                                              .resolve(
                                                  Directionality.of(context)),
                                          child: const PopUpConfirmWidget(
                                            headLine: 'Proceed to Buy?',
                                            message:
                                                'You will be redirected to our payment gateway provider to complete the transaction',
                                            confirmTxt: 'Proceed',
                                            cancel: 'Close',
                                          ),
                                        );
                                      },
                                    );
                                    if (!context.mounted) return;
                                    if (FFAppState().confirm == true) {
                                      await processRazorpayPayment(
                                        context,
                                        amount: 59900,
                                        currency: 'INR',
                                        receipt: (String var1, String var2) {
                                          return "${var2}_$var1";
                                        }(
                                            dateTimeFormat(
                                                "d/M/y", getCurrentTimestamp),
                                            currentUserReference!.id),
                                        description:
                                            '${currentUserReference?.id}-coinsPack',
                                        userName: currentUserDocument!
                                            .realId.fullName,
                                        userEmail: currentUserEmail,
                                        userContact: currentPhoneNumber,
                                        dialogColor: '#00000000',
                                        processingColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                        errorColor:
                                            FlutterFlowTheme.of(context).error,
                                        successColor:
                                            FlutterFlowTheme.of(context)
                                                .success,
                                        onReceivedResponse: (paymentId) =>
                                            safeSetState(() =>
                                                _model.razorpayPaymentId4 =
                                                    paymentId),
                                      );
                                      if (!context.mounted) return;
                                      if (_model.razorpayPaymentId4 != null &&
                                          _model.razorpayPaymentId4 != '') {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  const AlignmentDirectional(
                                                          0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: const PopUpNavigateWidget(
                                                headLine: 'Success 🎉',
                                                message:
                                                    'Your purchase is successful. Coins will be added soon.',
                                                confirmTxt: 'Close',
                                                pageName: 'back',
                                              ),
                                            );
                                          },
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                              'Due to technical Issue, your request may not be procesed at this moment.',
                                              style: GoogleFonts.robotoFlex(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                            duration: const Duration(
                                                milliseconds: 4000),
                                            backgroundColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondary,
                                          ),
                                        );
                                      }
                                    }

                                    safeSetState(() {});
                                  },
                                  child: wrapWithModel(
                                    model: _model.coinPackModel4,
                                    updateCallback: () => safeSetState(() {}),
                                    child: CoinPackWidget(
                                      price: '599/-',
                                      isHot: false,
                                      coins: 100,
                                      isSelected: _model.selected == 4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Earn Free Coins',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    font: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontSize: 22.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                    lineHeight: 1.3,
                                  ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color(0x1A34D399),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 4.0, 8.0, 4.0),
                                child: Text(
                                  'RESETS DAILY',
                                  style: FlutterFlowTheme.of(context)
                                      .labelSmall
                                      .override(
                                        font: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.bold,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmall
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 11.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .fontStyle,
                                        lineHeight: 1.2,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            context.pushNamed(AdMobPageWidget.routeName);
                          },
                          child: wrapWithModel(
                            model: _model.taskItemModel1,
                            updateCallback: () => safeSetState(() {}),
                            child: const TaskItemWidget(
                              icon: 'play_circle_outline_rounded',
                              title: 'Watch Video Ad',
                              subtitle: 'Limit: 3 per day',
                              reward: 1,
                            ),
                          ),
                        ),
                        Builder(
                          builder: (context) => InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Share.share(
                                'Paste the app link',
                                sharePositionOrigin:
                                    getWidgetBoundingBox(context),
                              );
                            },
                            child: wrapWithModel(
                              model: _model.taskItemModel2,
                              updateCallback: () => safeSetState(() {}),
                              child: const TaskItemWidget(
                                icon: 'share_rounded',
                                title: 'Invite a Friend',
                                subtitle: 'Get coins when they join',
                                reward: 10,
                              ),
                            ),
                          ),
                        ),
                        wrapWithModel(
                          model: _model.taskItemModel3,
                          updateCallback: () => safeSetState(() {}),
                          child: const TaskItemWidget(
                            icon: 'verified_rounded',
                            title: 'Complete Verification',
                            subtitle: 'One-time bonus',
                            reward: 10,
                          ),
                        ),
                      ].divide(const SizedBox(height: 16.0)),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0x1A9333EA),
                        borderRadius: BorderRadius.circular(24.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).secondary,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.info_outline_rounded,
                              color: FlutterFlowTheme.of(context).secondary,
                              size: 24.0,
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Why use coins?',
                                    style: FlutterFlowTheme.of(context)
                                        .labelLarge
                                        .override(
                                          font: GoogleFonts.plusJakartaSans(
                                            fontWeight: FontWeight.w600,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .labelLarge
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .labelLarge
                                                  .fontStyle,
                                          lineHeight: 1.3,
                                        ),
                                  ),
                                  Text(
                                    'Use coins to extend Chat timer, Reveal photos and details of mystery connection and more..',
                                    style: FlutterFlowTheme.of(context)
                                        .bodySmall
                                        .override(
                                          font: GoogleFonts.spaceGrotesk(
                                            fontWeight: FontWeight.normal,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .fontStyle,
                                          ),
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          fontSize: 13.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.normal,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodySmall
                                                  .fontStyle,
                                          lineHeight: 1.4,
                                        ),
                                  ),
                                ].divide(const SizedBox(height: 4.0)),
                              ),
                            ),
                          ].divide(const SizedBox(width: 16.0)),
                        ),
                      ),
                    ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
              Container(
                height: 24.0,
              ),
              Container(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      24.0, 0.0, 24.0, 24.0),
                  child: Text(
                    'Purchases are non-refundable. Terms & Conditions apply.',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).labelSmall.override(
                          font: GoogleFonts.spaceGrotesk(
                            fontWeight: FontWeight.bold,
                            fontStyle: FlutterFlowTheme.of(context)
                                .labelSmall
                                .fontStyle,
                          ),
                          color: FlutterFlowTheme.of(context).hint,
                          fontSize: 11.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle:
                              FlutterFlowTheme.of(context).labelSmall.fontStyle,
                          lineHeight: 1.2,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
