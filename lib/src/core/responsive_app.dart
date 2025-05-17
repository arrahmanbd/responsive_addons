part of 'package:responsive_addons/responsive_addons.dart';

/// A responsive wrapper widget with optional global error handling.
///  includes a BSOD-style fallback error screen.
///
/// **h()** - Calculates the percentage of the device's height.
/// Example: `40.h` → 40% of the device's height.
///
/// **w()** - Calculates the percentage of the device's width.
/// Example: `40.w` → 40% of the device's width.
///
/// **sp()** - Calculates the Scalable Pixel (sp) based on the device's pixel density and aspect ratio.
/// Example: `20.sp` → Scalable Pixel value.
///
/// **dp()** - Calculates the device's density-independent pixels (dp) based on the device's pixel density.
/// Example: `20.dp` → Density-independent pixels.
///
/// **Note:**
/// Use `h()` and `w()` by default to calculate based on the device’s full height and width.
/// Use `sh()` and `sw()` if you want to calculate based on the device's available height and width after applying SafeArea.
///
/// **sh()** - Calculates the percentage of the remaining device's height after applying SafeArea.
///
/// **sw()** - Calculates the percentage of the remaining device's width after applying SafeArea.
///
///
enum ErrorScreenStyle {
  pixelArt,
  catHacker,
  frost,
  blueCrash,
  brokenRobot,
  simple,
  codeTerminal,
  sifi,
  theater,
  dessert,
  book,
}

class ResponsiveApp extends StatelessWidget {
  final ErrorScreenStyle errorScreenStyle;
  final Size? designSize;
  final bool adaptDesign;
  final double maxMobileWidth;
  final double? maxTabletWidth;
  final Widget Function(
    BuildContext context,
    Orientation orientation,
    ScreenType screenType,
  ) builder;
  final FlutterExceptionHandler? onFlutterError;
  final Widget Function(FlutterErrorDetails error)? errorScreen;

  const ResponsiveApp({
    super.key,
    required this.builder,
    this.designSize,
    this.maxMobileWidth = 599,
    this.maxTabletWidth,
    this.onFlutterError,
    this.errorScreen,
    this.adaptDesign = true,
    this.errorScreenStyle = ErrorScreenStyle.dessert, // default
  });

  @override
  Widget build(BuildContext context) {
    _setupGlobalErrorHandlers();
    return BaseResponsiveWidget(
      builder: builder,
      designSize: designSize,
      maxMobileWidth: maxMobileWidth,
      maxTabletWidth: maxTabletWidth,
      adaptDesign: adaptDesign,
    );
  }

  /// Sets up global error handlers for uncaught Flutter errors.
  void _setupGlobalErrorHandlers() {
    // Handle Flutter error display
    ErrorWidget.builder = (FlutterErrorDetails details) {
      // If a custom error screen is provided, use it
      if (errorScreen != null) return errorScreen!(details);

      // Log the error for debugging
      final exception = details.exception.toString();
      _RDebugger.info('🥷 Issue detected: $exception');
      _RDebugger.info('🔍 Help: ${_makeQuery(exception)}');
      FlutterError.presentError(details);

      // Define the error screen based on selected error style
      Widget screen;
      switch (errorScreenStyle) {
        case ErrorScreenStyle.pixelArt:
          screen = _PixelArtErrorScreen(details);
          break;
        case ErrorScreenStyle.catHacker:
          screen = _CatHackerErrorScreen(details);
          break;
        case ErrorScreenStyle.frost:
          screen = _FrostErrorScreen(details);
          break;
        case ErrorScreenStyle.blueCrash:
          screen = _BlueScreenOfDeath(details);
          break;
        case ErrorScreenStyle.brokenRobot:
          screen = _AssistantErrorScreen(details);
          break;
        case ErrorScreenStyle.simple:
          screen = _AppErrorScreen(details);
          break;
        case ErrorScreenStyle.sifi:
          screen = _SciFiErrorScreen(details);
          break;
        case ErrorScreenStyle.theater:
          screen = _TheaterErrorScreen(details);
          break;
        case ErrorScreenStyle.dessert:
          screen = _Desert404ErrorScreen(details);
          break;
        case ErrorScreenStyle.book:
          screen = _ScrollErrorScreen(details);
          break;
        case ErrorScreenStyle.codeTerminal:
          screen = _TerminalErrorScreen(details);
          break;
      }

      return Material(color: Colors.transparent, child: screen);
    };
  }

  /// Generates a search query for troubleshooting the error.
  /// It returns a Google search link with the exception message.
  String _makeQuery(String exception) {
    String cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}
