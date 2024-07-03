class TimeAgoModel {
  int day = 0;
  int month = 0;
  int week = 0;
  int year = 0;

  @override
  String toString() {
    return '$year $month $week $day';
  }
}

TimeAgoModel makeYear(TimeAgoModel timeAgoModel) {
  return timeAgoModel
    ..year = timeAgoModel.day ~/ 365
    ..day = timeAgoModel.day % 365;
}

TimeAgoModel makeMonth(int days, TimeAgoModel timeAgoModel) {
  return timeAgoModel
    ..month = days ~/ 30
    ..day = days % 30;
}

TimeAgoModel makeWeek(int days, TimeAgoModel timeAgoModel) {
  return timeAgoModel
    ..week = days ~/ 7
    ..day = days % 7;
}

extension TimeExtension on int {
  String timeAgo({int? fromTimestamp, bool extended = false, String? suffix}) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(this);
    final fromDateTime = fromTimestamp == null
        ? DateTime.now()
        : DateTime.fromMillisecondsSinceEpoch(fromTimestamp);

    final diff = fromDateTime.difference(dateTime);

    final timeAgo = <String>[];

    if (diff.inDays <= 7) {
      /// if we are less than a week
      if (diff.inSeconds < 60) {
        timeAgo.add(extended ? '' : '${diff.inSeconds} s');
      } else if (diff.inMinutes <= 60) {
        timeAgo.add('${diff.inMinutes}${extended ? ' min' : 'm'}');
      } else if (diff.inHours <= 24) {
        timeAgo.add('${diff.inHours}${extended ? ' hr' : 'h'}');
      } else {
        timeAgo.add('${diff.inDays}${extended ? ' day' : 'd'}');
      }
    } else {
      var model = TimeAgoModel()..day = diff.inDays;

      model = makeYear(model);
      if (model.year > 0) timeAgo.add('${model.year}${extended ? ' yr' : 'y'}');

      /// if we have days remainder find out months
      if (model.day > 0) {
        model = makeMonth(model.day, model);
        if (model.month > 0) {
          timeAgo.add('${model.month}${extended ? ' mt' : 'm'}');
        }

        /// if we have days remainder find out weeks
        if (model.day > 0) {
          model = makeWeek(model.day, model);
          if (model.week > 0) {
            timeAgo.add('${model.week}${extended ? ' wk' : 'w'}');
          }

          /// if we still have days we add it too
          if (model.day > 0) {
            timeAgo.add('${model.day}${extended ? ' day' : 'd'}');
          }
        }
      }
    }
    return suffix == null ? timeAgo.join(',') : '${timeAgo.join(',')} $suffix';
  }
}
