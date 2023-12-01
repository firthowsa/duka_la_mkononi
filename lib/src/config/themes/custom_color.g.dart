//import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';

const orange = Color(0xFFF9A800);


CustomColors lightCustomColors = const CustomColors(
  sourceOrange: Color(0xFFF9A800),
  orange: Color(0xFF815500),
  onOrange: Color(0xFFFFFFFF),
  orangeContainer: Color(0xFFFFDDB2),
  onOrangeContainer: Color(0xFF291800),
);

CustomColors darkCustomColors = const CustomColors(
  sourceOrange: Color(0xFFF9A800),
  orange: Color(0xFFFFB94D),
  onOrange: Color(0xFF442B00),
  orangeContainer: Color(0xFF624000),
  onOrangeContainer: Color(0xFFFFDDB2),
);



/// Defines a set of custom colors, each comprised of 4 complementary tones.
///
/// See also:
///   * <https://m3.material.io/styles/color/the-color-system/custom-colors>
@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  const CustomColors({
    required this.sourceOrange,
    required this.orange,
    required this.onOrange,
    required this.orangeContainer,
    required this.onOrangeContainer,
  });

  final Color? sourceOrange;
  final Color? orange;
  final Color? onOrange;
  final Color? orangeContainer;
  final Color? onOrangeContainer;

  @override
  CustomColors copyWith({
    Color? sourceOrange,
    Color? orange,
    Color? onOrange,
    Color? orangeContainer,
    Color? onOrangeContainer,
  }) {
    return CustomColors(
      sourceOrange: sourceOrange ?? this.sourceOrange,
      orange: orange ?? this.orange,
      onOrange: onOrange ?? this.onOrange,
      orangeContainer: orangeContainer ?? this.orangeContainer,
      onOrangeContainer: onOrangeContainer ?? this.onOrangeContainer,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      sourceOrange: Color.lerp(sourceOrange, other.sourceOrange, t),
      orange: Color.lerp(orange, other.orange, t),
      onOrange: Color.lerp(onOrange, other.onOrange, t),
      orangeContainer: Color.lerp(orangeContainer, other.orangeContainer, t),
      onOrangeContainer: Color.lerp(onOrangeContainer, other.onOrangeContainer, t),
    );
  }

  /// Returns an instance of [CustomColors] in which the following custom
  /// colors are harmonized with [dynamic]'s [ColorScheme.primary].
  ///   * [CustomColors.sourceOrange]
  ///   * [CustomColors.orange]
  ///   * [CustomColors.onOrange]
  ///   * [CustomColors.orangeContainer]
  ///   * [CustomColors.onOrangeContainer]
  ///
  /// See also:
  ///   * <https://m3.material.io/styles/color/the-color-system/custom-colors#harmonization>
  // CustomColors harmonized(ColorScheme dynamic) {
  //   return copyWith(
  //     sourceOrange: sourceOrange!.harmonizeWith(dynamic.primary),
  //     orange: orange!.harmonizeWith(dynamic.primary),
  //     onOrange: onOrange!.harmonizeWith(dynamic.primary),
  //     orangeContainer: orangeContainer!.harmonizeWith(dynamic.primary),
  //     onOrangeContainer: onOrangeContainer!.harmonizeWith(dynamic.primary),
  //   );
  // }
}