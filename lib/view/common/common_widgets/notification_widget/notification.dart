import 'dart:ui';

import 'package:elegant_notification/elegant_notification.dart';
import 'package:elegant_notification/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ielts/view/common/common.dart';

ElegantNotification notificationError(String errorHead, String message) {
  return ElegantNotification.error(
      animation: AnimationType.fromTop,
      notificationPosition: NotificationPosition.topCenter,
      title: Text(
        errorHead,
        style: kNotificationTextStyle,
      ),
      description: Text(
        message,
        style: kNotificationTextStyleMessage,
      ));
}

notificationSuccess(String errorHead, String message) {
  return ElegantNotification.success(
      animation: AnimationType.fromTop,
      notificationPosition: NotificationPosition.topCenter,
      title: Text(
        errorHead,
        style: kNotificationTextStyleGreen,
      ),
      description: Text(
        message,
        style: kNotificationTextStyleMessage,
      ));
}
