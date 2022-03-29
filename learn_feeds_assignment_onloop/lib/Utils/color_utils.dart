import 'package:flutter/cupertino.dart';
import 'package:learn_feeds_assignment_onloop/utils/color_constants.dart';

Color getBorderColor(String filterTextColor) {
  switch (filterTextColor.toLowerCase()) {
    case 'grey':
      return kDarkGrey;
    case 'red':
      return kDarkRed;
    case 'yellow':
      return kDarkYellow;
    case 'green':
      return kDarkGreen;
    case 'blue':
      return kDarkBlue;
    default:
      return kDarkGrey;
  }
}

Color getFillColor(String filterTextColor) {
  switch (filterTextColor.toLowerCase()) {
    case 'grey':
      return kLightGrey;
    case 'red':
      return kLightPink;
    case 'yellow':
      return kLemonYellow;
    case 'green':
      return kLightGreen;
    case 'blue':
      return kLightBlue;
    default:
      return kLightGrey;
  }
}
