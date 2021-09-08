import 'package:eshiblood/src/appointment/data_provider/appointment_data_provider.dart';
import 'package:eshiblood/src/appointment/models/models.dart';

class AppointmentRepository {
  final AppointmentDataProvider dataProvider;
  AppointmentRepository(this.dataProvider);

  Future<Appointment> fetchOne(dynamic id) {
    print("from repo");
    return this.dataProvider.fetchOne(id);
  }

  Future<Appointment> create(Appointment appointment) {
    print("from repo");
    return this.dataProvider.create(appointment);
  }

  Future<Appointment> update(dynamic id, Appointment appointment) async {
    return this.dataProvider.update(id, appointment);
  }

  Future<List<Appointment>> fetchAll() async {
    print("from repo");
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(dynamic id) async {
    this.dataProvider.delete(id);
  }
}
