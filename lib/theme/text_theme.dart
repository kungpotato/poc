import 'package:color_type_converter/exports.dart';
import 'package:poc/theme/app_color.dart' show KpColorSeed;

final textTheme = TextTheme(
  titleMedium: TextStyle(
    fontSize: 18, // Increased for better readability
    color: KpColorSeed.instance.front,
  ),
  titleLarge: TextStyle(
    fontSize: 24, // Increased for better hierarchy
    color: KpColorSeed.instance.front,
  ),
  titleSmall: TextStyle(
    fontSize: 16, // Adjusted for consistency
    color: KpColorSeed.instance.front,
  ),
  bodySmall: TextStyle(
    fontSize: 14, // Standard for small body text
    color: KpColorSeed.instance.front,
  ),
  bodyLarge: TextStyle(
    fontSize: 20, // Suitable for important body content
    color: KpColorSeed.instance.front,
  ),
  bodyMedium: TextStyle(
    fontSize: 18, // Standard body text size
    color: KpColorSeed.instance.front,
  ),
  displayLarge: TextStyle(
    fontSize: 48, // Suitable for large headers or banners
    color: KpColorSeed.instance.front,
  ),
  displayMedium: TextStyle(
    fontSize: 36, // Used for sub-headers
    color: KpColorSeed.instance.front,
  ),
  displaySmall: TextStyle(
    fontSize: 28, // Suitable for smaller section titles
    color: KpColorSeed.instance.front,
  ),
  headlineLarge: TextStyle(
    fontSize: 32, // Prominent headlines
    color: KpColorSeed.instance.front,
  ),
  headlineMedium: TextStyle(
    fontSize: 28, // Section headers
    color: KpColorSeed.instance.front,
  ),
  headlineSmall: TextStyle(
    fontSize: 24, // Smaller section headers
    color: KpColorSeed.instance.front,
  ),
  labelLarge: TextStyle(
    fontSize: 18, // For buttons and labels
    color: KpColorSeed.instance.front,
  ),
  labelMedium: TextStyle(
    fontSize: 16, // Medium labels
    color: KpColorSeed.instance.front,
  ),
  labelSmall: TextStyle(
    fontSize: 14, // Small labels and captions
    color: KpColorSeed.instance.front,
  ),
);
