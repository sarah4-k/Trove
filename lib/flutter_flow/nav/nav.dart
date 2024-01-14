import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

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
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const Page1Widget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const Page1Widget(),
        ),
        FFRoute(
          name: 'Homepage',
          path: '/homepage',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Homepage')
              : HomepageWidget(
                  quizRef: params.getParam(
                      'quizRef', ParamType.DocumentReference, false, ['Quiz']),
                ),
        ),
        FFRoute(
          name: 'java',
          path: '/java',
          builder: (context, params) => JavaWidget(
            duration: params.getParam('duration', ParamType.int),
            quiz: params.getParam<DocumentReference>(
                'quiz', ParamType.DocumentReference, true, ['Quiz']),
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['Quiz']),
          ),
        ),
        FFRoute(
          name: 'LessonsJava',
          path: '/lessonsJava',
          builder: (context, params) => LessonsJavaWidget(
            quizReff: params.getParam(
                'quizReff', ParamType.DocumentReference, false, ['Quiz']),
          ),
        ),
        FFRoute(
          name: 'QuizzsJava',
          path: '/quizzsJava',
          builder: (context, params) => QuizzsJavaWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['Quiz']),
            quizDuration: params.getParam('quizDuration', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'CyberSecurity',
          path: '/cyberSecurity',
          builder: (context, params) => const CyberSecurityWidget(),
        ),
        FFRoute(
          name: 'LessonsCyberSecurity',
          path: '/lessonsCyberSecurity',
          builder: (context, params) => LessonsCyberSecurityWidget(
            video: params.getParam<dynamic>('video', ParamType.JSON, true),
          ),
        ),
        FFRoute(
          name: 'QuizzesCyberSecurity',
          path: '/quizzesCyberSecurity',
          builder: (context, params) => const QuizzesCyberSecurityWidget(),
        ),
        FFRoute(
          name: 'login',
          path: '/login',
          builder: (context, params) => const LoginWidget(),
        ),
        FFRoute(
          name: 'signup',
          path: '/signup',
          builder: (context, params) => const SignupWidget(),
        ),
        FFRoute(
          name: 'SecondPageQuizJava',
          path: '/secondPageQuizJava',
          builder: (context, params) => SecondPageQuizJavaWidget(
            scoreAchieved: params.getParam('scoreAchieved', ParamType.int),
            totalQuestions: params.getParam('totalQuestions', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'Python',
          path: '/python',
          builder: (context, params) => const PythonWidget(),
        ),
        FFRoute(
          name: 'LessonsPython',
          path: '/lessonsPython',
          builder: (context, params) => const LessonsPythonWidget(),
        ),
        FFRoute(
          name: 'QuizzesPython',
          path: '/quizzesPython',
          builder: (context, params) => const QuizzesPythonWidget(),
        ),
        FFRoute(
          name: 'Page1',
          path: '/page1',
          builder: (context, params) => const Page1Widget(),
        ),
        FFRoute(
          name: 'DiscussionBoard',
          path: '/discussionBoard',
          asyncParams: {
            'notifications': getDoc(
                ['users', 'Notifications2'], Notifications2Record.fromSnapshot),
          },
          builder: (context, params) => DiscussionBoardWidget(
            notifications: params.getParam('notifications', ParamType.Document),
          ),
        ),
        FFRoute(
          name: 'AboutUs',
          path: '/aboutUs',
          builder: (context, params) => const AboutUsWidget(),
        ),
        FFRoute(
          name: 'Courses',
          path: '/courses',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Courses')
              : CoursesWidget(
                  refQuiz: params.getParam(
                      'refQuiz', ParamType.DocumentReference, false, ['Quiz']),
                ),
        ),
        FFRoute(
          name: 'Settings',
          path: '/settings',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Settings')
              : const SettingsWidget(),
        ),
        FFRoute(
          name: 'searchPage',
          path: '/searchPage',
          builder: (context, params) => const SearchPageWidget(),
        ),
        FFRoute(
          name: 'videodetails',
          path: '/videodetails',
          builder: (context, params) => VideodetailsWidget(
            video: params.getParam('video', ParamType.JSON),
          ),
        ),
        FFRoute(
          name: 'Support',
          path: '/support',
          builder: (context, params) => const SupportWidget(),
        ),
        FFRoute(
          name: 'JavaArticles',
          path: '/javaArticles',
          builder: (context, params) => const JavaArticlesWidget(),
        ),
        FFRoute(
          name: 'Java101',
          path: '/java101',
          builder: (context, params) => const Java101Widget(),
        ),
        FFRoute(
          name: 'PythonArtical',
          path: '/pythonArtical',
          builder: (context, params) => const PythonArticalWidget(),
        ),
        FFRoute(
          name: 'CyberArticle',
          path: '/cyberArticle',
          builder: (context, params) => const CyberArticleWidget(),
        ),
        FFRoute(
          name: 'Java101p2',
          path: '/java101p2',
          builder: (context, params) => const Java101p2Widget(),
        ),
        FFRoute(
          name: 'Java101p4',
          path: '/java101p4',
          builder: (context, params) => const Java101p4Widget(),
        ),
        FFRoute(
          name: 'Java101p5',
          path: '/java101p5',
          builder: (context, params) => const Java101p5Widget(),
        ),
        FFRoute(
          name: 'Java101p7',
          path: '/java101p7',
          builder: (context, params) => const Java101p7Widget(),
        ),
        FFRoute(
          name: 'Java101p6',
          path: '/java101p6',
          builder: (context, params) => const Java101p6Widget(),
        ),
        FFRoute(
          name: 'Java101p8',
          path: '/java101p8',
          builder: (context, params) => const Java101p8Widget(),
        ),
        FFRoute(
          name: 'Editprofile',
          path: '/editprofile',
          builder: (context, params) => const EditprofileWidget(),
        ),
        FFRoute(
          name: 'blank',
          path: '/blank',
          builder: (context, params) => const BlankWidget(),
        ),
        FFRoute(
          name: 'Java101p3',
          path: '/java101p3',
          builder: (context, params) => const Java101p3Widget(),
        ),
        FFRoute(
          name: 'Python101p1',
          path: '/python101p1',
          builder: (context, params) => const Python101p1Widget(),
        ),
        FFRoute(
          name: 'Python101p2',
          path: '/python101p2',
          builder: (context, params) => const Python101p2Widget(),
        ),
        FFRoute(
          name: 'Python101p3',
          path: '/python101p3',
          builder: (context, params) => const Python101p3Widget(),
        ),
        FFRoute(
          name: 'Python101p4',
          path: '/python101p4',
          builder: (context, params) => const Python101p4Widget(),
        ),
        FFRoute(
          name: 'Python101p5',
          path: '/python101p5',
          builder: (context, params) => const Python101p5Widget(),
        ),
        FFRoute(
          name: 'Python101p6',
          path: '/python101p6',
          builder: (context, params) => const Python101p6Widget(),
        ),
        FFRoute(
          name: 'Python101p7',
          path: '/python101p7',
          builder: (context, params) => const Python101p7Widget(),
        ),
        FFRoute(
          name: 'Python101p8',
          path: '/python101p8',
          builder: (context, params) => const Python101p8Widget(),
        ),
        FFRoute(
          name: 'Cyber101p1',
          path: '/cyber101p1',
          builder: (context, params) => const Cyber101p1Widget(),
        ),
        FFRoute(
          name: 'Cyber101p2',
          path: '/cyber101p2',
          builder: (context, params) => const Cyber101p2Widget(),
        ),
        FFRoute(
          name: 'Cyber101p3',
          path: '/cyber101p3',
          builder: (context, params) => const Cyber101p3Widget(),
        ),
        FFRoute(
          name: 'Cyber101p4',
          path: '/cyber101p4',
          builder: (context, params) => const Cyber101p4Widget(),
        ),
        FFRoute(
          name: 'Cyber101p5',
          path: '/cyber101p5',
          builder: (context, params) => const Cyber101p5Widget(),
        ),
        FFRoute(
          name: 'PythonQuiz',
          path: '/pythonQuiz',
          builder: (context, params) => const PythonQuizWidget(),
        ),
        FFRoute(
          name: 'QuizzsJavaCopy',
          path: '/quizzsJavaCopy',
          builder: (context, params) => QuizzsJavaCopyWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['Quiz']),
            quizDuration: params.getParam('quizDuration', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'QuizzsJavaCopyCopy',
          path: '/quizzsJavaCopyCopy',
          builder: (context, params) => QuizzsJavaCopyCopyWidget(
            quizRef: params.getParam(
                'quizRef', ParamType.DocumentReference, false, ['Quiz']),
            quizDuration: params.getParam('quizDuration', ParamType.int),
          ),
        ),
        FFRoute(
          name: 'QuizzesPage',
          path: '/quizzesPage',
          builder: (context, params) => const QuizzesPageWidget(),
        ),
        FFRoute(
          name: 'FlashCards',
          path: '/flashCards',
          builder: (context, params) => FlashCardsWidget(
            lahguageRef: params.getParam('lahguageRef',
                ParamType.DocumentReference, false, ['ProgLanguages']),
          ),
        ),
        FFRoute(
          name: 'QuizzesPageWrite',
          path: '/quizzesPageWrite',
          builder: (context, params) => const QuizzesPageWriteWidget(),
        ),
        FFRoute(
          name: 'supportpage2',
          path: '/supportpage2',
          builder: (context, params) => const Supportpage2Widget(),
        ),
        FFRoute(
          name: 'ForgetPass',
          path: '/forgetPass',
          builder: (context, params) => const ForgetPassWidget(),
        ),
        FFRoute(
          name: 'chat',
          path: '/chat',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'chat') : const ChatWidget(),
        ),
        FFRoute(
          name: 'Notify',
          path: '/notify',
          builder: (context, params) => const NotifyWidget(),
        ),
        FFRoute(
          name: 'ChatNotifications',
          path: '/chatNotifications',
          builder: (context, params) => ChatNotificationsWidget(
            topicid: params.getParam(
                'topicid', ParamType.DocumentReference, false, ['topics']),
          ),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
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
    ..addAll(queryParameters)
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
      (state.extraMap.length == 1 &&
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
    ParamType type, [
    bool isList = false,
    List<String>? collectionNamePath,
  ]) {
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
    return deserializeParam<T>(param, type, isList,
        collectionNamePath: collectionNamePath);
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
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/page1';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? const Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFFF70003),
                      ),
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
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
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
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

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
