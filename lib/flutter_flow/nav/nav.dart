import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/genz_animations.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? DashboardWidget() : SplashWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? WaitPageWidget() : SplashWidget(),
        ),
        FFRoute(
          name: SplashWidget.routeName,
          path: SplashWidget.routePath,
          builder: (context, params) => SplashWidget(),
        ),
        FFRoute(
          name: BillingWidget.routeName,
          path: BillingWidget.routePath,
          builder: (context, params) => BillingWidget(),
        ),
        FFRoute(
          name: SecurityWidget.routeName,
          path: SecurityWidget.routePath,
          builder: (context, params) => SecurityWidget(),
        ),
        FFRoute(
          name: SettingsWidget.routeName,
          path: SettingsWidget.routePath,
          builder: (context, params) => SettingsWidget(),
        ),
        FFRoute(
          name: VibesWidget.routeName,
          path: VibesWidget.routePath,
          builder: (context, params) => VibesWidget(),
        ),
        FFRoute(
          name: RevealOptionWidget.routeName,
          path: RevealOptionWidget.routePath,
          builder: (context, params) => RevealOptionWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
            requestId: params.getParam(
              'requestId',
              ParamType.String,
            ),
            incomingDocId: params.getParam(
              'incomingDocId',
              ParamType.String,
            ),
            senderUid: params.getParam(
              'senderUid',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UserPersonaWidget.routeName,
          path: UserPersonaWidget.routePath,
          builder: (context, params) => UserPersonaWidget(),
        ),
        FFRoute(
          name: ReportWidget.routeName,
          path: ReportWidget.routePath,
          builder: (context, params) => ReportWidget(
            chatId: params.getParam(
              'chatId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: CoinShopWidget.routeName,
          path: CoinShopWidget.routePath,
          builder: (context, params) => CoinShopWidget(),
        ),
        FFRoute(
          name: ActiveChatWidget.routeName,
          path: ActiveChatWidget.routePath,
          builder: (context, params) => ActiveChatWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
            iceBreakers: params.getParam(
              'iceBreakers',
              ParamType.String,
            ),
            endTime: params.getParam(
              'endTime',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: MobileEntryWidget.routeName,
          path: MobileEntryWidget.routePath,
          builder: (context, params) => MobileEntryWidget(),
        ),
        FFRoute(
          name: CountrySelectionOldWidget.routeName,
          path: CountrySelectionOldWidget.routePath,
          builder: (context, params) => CountrySelectionOldWidget(),
        ),
        FFRoute(
          name: OTPScreenWidget.routeName,
          path: OTPScreenWidget.routePath,
          builder: (context, params) => OTPScreenWidget(),
        ),
        FFRoute(
          name: DashboardWidget.routeName,
          path: DashboardWidget.routePath,
          builder: (context, params) => DashboardWidget(),
        ),
        FFRoute(
          name: OnboardingWidget.routeName,
          path: OnboardingWidget.routePath,
          builder: (context, params) => OnboardingWidget(
            userLocation: params.getParam(
              'userLocation',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: IcebreakersOldWidget.routeName,
          path: IcebreakersOldWidget.routePath,
          builder: (context, params) => IcebreakersOldWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ExtendScreenOldWidget.routeName,
          path: ExtendScreenOldWidget.routePath,
          builder: (context, params) => ExtendScreenOldWidget(),
        ),
        FFRoute(
          name: DiscoverySettingsOldWidget.routeName,
          path: DiscoverySettingsOldWidget.routePath,
          builder: (context, params) => DiscoverySettingsOldWidget(),
        ),
        FFRoute(
          name: MapPageWidget.routeName,
          path: MapPageWidget.routePath,
          builder: (context, params) => MapPageWidget(),
        ),
        FFRoute(
          name: AdMobPageWidget.routeName,
          path: AdMobPageWidget.routePath,
          builder: (context, params) => AdMobPageWidget(),
        ),
        FFRoute(
          name: SlotSelectionWidget.routeName,
          path: SlotSelectionWidget.routePath,
          builder: (context, params) => SlotSelectionWidget(),
        ),
        FFRoute(
          name: HandshakePageWidget.routeName,
          path: HandshakePageWidget.routePath,
          builder: (context, params) => HandshakePageWidget(
            handshakeID: params.getParam(
              'handshakeID',
              ParamType.String,
            ),
            slotFolder: params.getParam(
              'slotFolder',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatWaitPageWidget.routeName,
          path: ChatWaitPageWidget.routePath,
          builder: (context, params) => ChatWaitPageWidget(
            handShakeID: params.getParam(
              'handShakeID',
              ParamType.String,
            ),
            slotFolder: params.getParam(
              'slotFolder',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChatRejectPageOldWidget.routeName,
          path: ChatRejectPageOldWidget.routePath,
          builder: (context, params) => ChatRejectPageOldWidget(),
        ),
        FFRoute(
          name: PersonaUpdatePageWidget.routeName,
          path: PersonaUpdatePageWidget.routePath,
          builder: (context, params) => PersonaUpdatePageWidget(
            handShakeID: params.getParam(
              'handShakeID',
              ParamType.String,
            ),
            slotFolder: params.getParam(
              'slotFolder',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WaitPageWidget.routeName,
          path: WaitPageWidget.routePath,
          builder: (context, params) => WaitPageWidget(),
        ),
        FFRoute(
          name: ActiveChatPageWidget.routeName,
          path: ActiveChatPageWidget.routePath,
          builder: (context, params) => ActiveChatPageWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
            iceBreakers: params.getParam(
              'iceBreakers',
              ParamType.String,
            ),
            endTime: params.getParam(
              'endTime',
              ParamType.int,
            ),
          ),
        ),
        FFRoute(
          name: PublicPersonaWidget.routeName,
          path: PublicPersonaWidget.routePath,
          builder: (context, params) => PublicPersonaWidget(
            partnerId: params.getParam(
              'partnerId',
              ParamType.String,
            ),
            fields: params.getParam<String>(
              'fields',
              ParamType.String,
              isList: true,
            ),
          ),
        ),
        FFRoute(
          name: PostChatScreenWidget.routeName,
          path: PostChatScreenWidget.routePath,
          builder: (context, params) => PostChatScreenWidget(
            survey: params.getParam(
              'survey',
              ParamType.bool,
            ),
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateProfileWidget.routeName,
          path: UpdateProfileWidget.routePath,
          builder: (context, params) => UpdateProfileWidget(
            userLocation: params.getParam(
              'userLocation',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: SocialPageWidget.routeName,
          path: SocialPageWidget.routePath,
          builder: (context, params) => SocialPageWidget(
            userLocation: params.getParam(
              'userLocation',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: UpdateSocialPageWidget.routeName,
          path: UpdateSocialPageWidget.routePath,
          builder: (context, params) => UpdateSocialPageWidget(
            userLocation: params.getParam(
              'userLocation',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: VerifyIntroWidget.routeName,
          path: VerifyIntroWidget.routePath,
          builder: (context, params) => VerifyIntroWidget(),
        ),
        FFRoute(
          name: VerifyConfirmWidget.routeName,
          path: VerifyConfirmWidget.routePath,
          builder: (context, params) => VerifyConfirmWidget(),
        ),
        FFRoute(
          name: VerificationSuccessfulWidget.routeName,
          path: VerificationSuccessfulWidget.routePath,
          builder: (context, params) => VerificationSuccessfulWidget(),
        ),
        FFRoute(
          name: ChangeMobileOTPWidget.routeName,
          path: ChangeMobileOTPWidget.routePath,
          builder: (context, params) => ChangeMobileOTPWidget(
            verificationId: params.getParam(
              'verificationId',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: ChangeMobileWidget.routeName,
          path: ChangeMobileWidget.routePath,
          builder: (context, params) => ChangeMobileWidget(),
        ),
        FFRoute(
          name: PermChatPageWidget.routeName,
          path: PermChatPageWidget.routePath,
          builder: (context, params) => PermChatPageWidget(
            chatID: params.getParam(
              'chatID',
              ParamType.String,
            ),
            partnerName: params.getParam(
              'partnerName',
              ParamType.String,
            ),
            partnerAge: params.getParam(
              'partnerAge',
              ParamType.int,
            ),
            partnerGender: params.getParam(
              'partnerGender',
              ParamType.String,
            ),
            partnerPhoto: params.getParam(
              'partnerPhoto',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: WaitPageCopyWidget.routeName,
          path: WaitPageCopyWidget.routePath,
          builder: (context, params) => WaitPageCopyWidget(),
        ),
        FFRoute(
          name: WaitPageCopy2Widget.routeName,
          path: WaitPageCopy2Widget.routePath,
          builder: (context, params) => WaitPageCopy2Widget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/splash';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Center(
                    child: Image.asset(
                      'assets/images/ic_launcher_foreground.png',
                      width: 150.0,
                      height: 150.0,
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return CustomTransitionPage(
            key: state.pageKey,
            name: state.name,
            child: child,
            transitionDuration: transitionInfo.hasTransition
                ? transitionInfo.duration
                : const Duration(milliseconds: 340),
            reverseTransitionDuration: const Duration(milliseconds: 260),
            transitionsBuilder: transitionInfo.hasTransition
                ? (context, animation, secondaryAnimation, child) =>
                    PageTransition(
                      type: transitionInfo.transitionType,
                      duration: transitionInfo.duration,
                      reverseDuration: transitionInfo.duration,
                      alignment: transitionInfo.alignment,
                      child: child,
                    ).buildTransitions(
                      context,
                      animation,
                      secondaryAnimation,
                      child,
                    )
                : genzPageTransitionsBuilder,
          );
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
