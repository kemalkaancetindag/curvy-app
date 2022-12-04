import 'package:curvy_app/constants/dimensions.dart';
import 'package:get/get.dart';

class MatcherController extends GetxController {
  bool _isFreeStyle = false;
  bool _isMatcherStyleExpanded = false;
  double unSelectedWidth = Dimensions.w120 - Dimensions.w8;
  double  selectedWidth = Dimensions.w180;

  bool get isFreeStyle => _isFreeStyle;
  bool get isMatcherStyleExpanded => _isMatcherStyleExpanded;

  void setStyle(bool style) {
    _isFreeStyle = style;
    update();
  }

  void setExpansion(bool expansion) {
    _isMatcherStyleExpanded = expansion;
    update();
  }
}