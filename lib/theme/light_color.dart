import 'package:color_type_converter/exports.dart';
import 'package:poc/theme/app_color.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: KpColorSeed.instance.primary,
  onPrimary: Colors.white,
  primaryContainer: KpColorSeed.instance.primary.withValues(alpha: 0.1),
  onPrimaryContainer: KpColorSeed.instance.primary.withValues(alpha: 0.8),
  secondary: KpColorSeed.instance.secondary,
  onSecondary: Colors.white,
  secondaryContainer: KpColorSeed.instance.secondary.withValues(alpha: 0.1),
  onSecondaryContainer: KpColorSeed.instance.secondary.withValues(alpha: 0.8),
  tertiary: KpColorSeed.instance.tertiary,
  onTertiary: Colors.white,
  tertiaryContainer: KpColorSeed.instance.tertiary.withValues(alpha: 0.1),
  onTertiaryContainer: KpColorSeed.instance.tertiary.withValues(alpha: 0.8),
  error: KpColorSeed.instance.danger,
  onError: Colors.white,
  errorContainer: KpColorSeed.instance.danger.withValues(alpha: 0.1),
  onErrorContainer: KpColorSeed.instance.danger.withValues(alpha: 0.8),
  surface: Colors.white,
  onSurface: KpColorSeed.instance.front,
  surfaceContainerHighest: Colors.grey.shade200,
  onSurfaceVariant: Colors.black54,
  outline: Colors.grey,
  shadow: Colors.black26,
  inverseSurface: KpColorSeed.instance.front,
  onInverseSurface: Colors.white,
  inversePrimary: KpColorSeed.instance.primary.withValues(alpha: 0.7),
  surfaceTint: KpColorSeed.instance.primary,
);
