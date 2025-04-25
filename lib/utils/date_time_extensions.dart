import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  /// Format: "April, 2025"
  String get monthYear => DateFormat('MMMM, yyyy').format(this);

  /// Format: "16 jun 2025"
  String get shortDate => DateFormat('dd MMM yyyy').format(this);

  /// Format: "June 16, 2025"
  String get fullDate => DateFormat('MMMM dd, yyyy').format(this);

  /// Format: "16"
  String get day => DateFormat('dd').format(this);

  /// Format: "jun"
  String get shortMonth => DateFormat('MMM').format(this).toLowerCase();

  /// Format: "2025"
  String get year => DateFormat('yyyy').format(this);
}
