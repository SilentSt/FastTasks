import 'package:easy_localization/easy_localization.dart';
import 'package:tasklet/gen/locale_keys.g.dart';

enum TaskDuration {
  day,
  week,
  month,
  quarter,
}

extension Title on TaskDuration {
  String get title {
    switch (this) {
      case TaskDuration.day:
        return LocaleKeys.day.tr();
      case TaskDuration.week:
        return LocaleKeys.week.tr();
      case TaskDuration.month:
        return LocaleKeys.month.tr();
      case TaskDuration.quarter:
        return LocaleKeys.quarter.tr();
    }
  }
}

enum TaskStatus { n, i, r, d }

extension ToString on TaskStatus {
  String get title {
    switch (this) {
      case TaskStatus.n:
        return LocaleKeys.neW.tr();
      case TaskStatus.i:
        return LocaleKeys.doing.tr();
      case TaskStatus.r:
        return LocaleKeys.review.tr();
      case TaskStatus.d:
        return LocaleKeys.done.tr();
    }
  }
}

TaskStatus taskStatusfromInt(int st) {
  return TaskStatus.values[st];
}

extension ToApi on TaskDuration {
  int get toApi {
    switch (this) {
      case TaskDuration.day:
        return 1;
      case TaskDuration.week:
        return 7;
      case TaskDuration.month:
        return 30;
      case TaskDuration.quarter:
        return 90;
    }
  }
}

TaskDuration? fromApi(int dur) {
  switch (dur) {
    case 1:
      return TaskDuration.day;
    case 7:
      return TaskDuration.week;
    case 30:
      return TaskDuration.month;

    case 90:
      return TaskDuration.quarter;
  }
  return null;
}
