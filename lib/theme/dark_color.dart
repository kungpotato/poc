import 'package:color_type_converter/exports.dart';
import 'package:poc/theme/generated_tokens/kp_color.dart';

final darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: KpColor.primaryDark.withValues(alpha: 0.8),
  onPrimary: KpColor.onPrimaryDark,
  primaryContainer: KpColor.primaryDark.withValues(alpha: 0.3),
  onPrimaryContainer: KpColor.onPrimaryDark,
  secondary: KpColor.secondaryDark.withValues(alpha: 0.8),
  onSecondary: KpColor.onSecondaryDark,
  secondaryContainer: KpColor.secondaryDark.withValues(alpha: 0.3),
  onSecondaryContainer: KpColor.onSecondaryDark,
  tertiary: KpColor.secondaryDark,
  // Assuming same as secondary
  onTertiary: Colors.white,
  tertiaryContainer: KpColor.secondaryDark.withValues(alpha: 0.2),
  onTertiaryContainer: Colors.white,
  error: KpColor.errorDark,
  onError: KpColor.onErrorDark,
  errorContainer: KpColor.errorDark.withValues(alpha: 0.3),
  onErrorContainer: KpColor.onErrorDark,
  surface: KpColor.surfaceDark,
  onSurface: KpColor.textPrimaryDark,
  surfaceContainerHighest: Colors.grey.shade800,
  onSurfaceVariant: KpColor.textSecondaryDark,
  outline: KpColor.borderDark,
  shadow: Colors.black87,
  inverseSurface: KpColor.surfaceLight,
  onInverseSurface: KpColor.textPrimaryLight,
  inversePrimary: KpColor.primaryDark.withValues(alpha: 0.5),
  surfaceTint: KpColor.primaryDark,
);
