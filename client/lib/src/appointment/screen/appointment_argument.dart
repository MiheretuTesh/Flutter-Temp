import 'package:eshiblood/src/appointment/models/models.dart';

class AppointmentArgument {
  final Appointment? appointment;
  final bool edit;
  AppointmentArgument({this.appointment, required this.edit});
}
