part of 'locale.dart';

class LocaleStrings {
  LocaleStrings._(); // coverage:ignore-line

  static String get appName => 'appName'.tr();
  static String get retry => 'retry'.tr();
  static String get menu => 'menu'.tr();
  static String get data => 'data'.tr();
  static String get employees => 'employees'.tr();
  static String get absences => 'absences'.tr();
  static String get confirm => 'confirm'.tr();
  static String get reject => 'reject'.tr();
  static String get all => 'all'.tr();
  static String get date => 'date'.tr();
  static String get absenceDetails => 'absenceDetails'.tr();
  static String get noAbsenceFound => 'noAbsenceFound'.tr();
  static String get fromDate => 'fromDate'.tr();
  static String get toDate => 'toDate'.tr();
  static String get requestedAt => 'requestedAt'.tr();
  static String get rejectedAt => 'rejectedAt'.tr();
  static String get confirmedAt => 'confirmedAt'.tr();
  static String get requesteeNote => 'requesteeNote'.tr();
  static String get admitterNote => 'admitterNote'.tr();
  static String get requestAbsence => 'requestAbsence'.tr();
  static String get noEmployeeFound => 'noEmployeeFound'.tr();
  static String get showMore => 'showMore'.tr();
  static String get enterHere => 'enterHere'.tr();
  static String get syncronize => 'syncronize'.tr();
  static String get requested => 'requested'.tr();
  static String get confirmed => 'confirmed'.tr();
  static String get rejected => 'rejected'.tr();
  static String get sickness => 'sickness'.tr();
  static String get vacation => 'vacation'.tr();

  static String emptyMessage([String? value]) =>
      'emptyMessage'.tr(args: [value ?? LocaleStrings.data]);

  static String days([int? value]) => plural('days', value ?? 0);

  static String absenceCount([int? value]) =>
      plural('absenceCount', value ?? 0);
}
