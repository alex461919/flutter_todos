// ignore_for_file: constant_identifier_names, avoid_equals_and_hash_code_on_mutable_classes

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'date_range_bloc_state.freezed.dart';

abstract class Enum<T> {
  final T _value;
  const Enum(this._value);
  T get value => _value;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Enum<T> && other._value == _value;
  }

  @override
  int get hashCode => _value.hashCode;
  @override
  String toString() => 'Enum(value: $_value)';
}

class DateRange {
  final String title;
  final DateTimeRange Function() rangeFn;
  const DateRange(this.title, this.rangeFn);
  @override
  String toString() => 'DateRange(title: $title, range: $rangeFn)';
}

class DateRangeEnum extends Enum<DateRange> {
  const DateRangeEnum(DateRange val) : super(val);
  static DateTime minDateTime = DateTime.utc(-271821, 04, 20);
  static DateTime maxDateTime = DateTime.utc(275760, 09, 13);

  static DateTimeRange getDateRange(Duration start, Duration end) {
    final dateTimeNow = DateTime.now();
    final dateNow = DateTime(dateTimeNow.year, dateTimeNow.month, dateTimeNow.day);
    return DateTimeRange(start: dateNow.add(start), end: dateNow.add(end));
  }

  static DateTimeRange _getTodayRange() => getDateRange(const Duration(days: 0), const Duration(days: 1));
  static DateTimeRange _getTomorrowRange() => getDateRange(const Duration(days: 1), const Duration(days: 2));
  static DateTimeRange _getWeeklyRange() => getDateRange(const Duration(days: 0), const Duration(days: 7));
  static DateTimeRange _getAlwaysRange() => DateTimeRange(start: minDateTime, end: maxDateTime);

  static const Today = DateRangeEnum(DateRange('На сегодня', _getTodayRange));
  static const Tomorrow = DateRangeEnum(DateRange('На завтра', _getTomorrowRange));
  static const Weekly = DateRangeEnum(DateRange('На неделю', _getWeeklyRange));
  static const Always = DateRangeEnum(DateRange('За все время', _getAlwaysRange));
}

@freezed
class DateRangeBlocState with _$DateRangeBlocState {
  const DateRangeBlocState._();
  const factory DateRangeBlocState(
      {required int activeRangeIndex,
      @Default([
        DateRangeEnum.Today,
        DateRangeEnum.Tomorrow,
        DateRangeEnum.Weekly,
        DateRangeEnum.Always,
      ])
          List<DateRangeEnum> dateRangeList}) = _DateRangeBlocState;
  DateRangeEnum get activeRangeEnum => dateRangeList[activeRangeIndex];
  DateRange get activeRange => activeRangeEnum.value;
}
