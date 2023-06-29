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

enum TaskStatus { n, i, r, d, c,}

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
      case TaskStatus.c:
        return 'Завершена'.tr();
    }
  }
}

TaskStatus taskStatusfromStr(String st) {
  switch(st){
    case "New":return TaskStatus.values[0];
    case "Doing":return TaskStatus.values[1];
    case "Review":return TaskStatus.values[2];
    case "Done":return TaskStatus.values[3];
    case "Closed":return TaskStatus.values[4];
  }
  return TaskStatus.values[0];
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
