// import 'dart:convert;
import 'dart:convert';

import 'package:eshiblood/src/appointment/models/models.dart';
import 'package:dio/dio.dart';
import 'package:eshiblood/src/utilities/constants.dart';

class AppointmentDataProvider {
  static final String _baseUrl = '${Constants.baseUrl}/appointments';
  static final dynamic _headers = {
    "accept": "/",
    // For latter use commented
    "Authorization": "Bearer ${Constants.token}",
    "Content-Type": "application/json"
  };
  AppointmentDataProvider();

  Future<Appointment> create(Appointment appointment) async {
    try {
      print("creating Appointment start ...");
      final response = await Dio().post('$_baseUrl/',
          data: {
            "userId": appointment.userId,
            "startDate": appointment.startDate,
            "endDate": appointment.endDate,
            "appointmentDescription": appointment.appointmentDescription,
            "weight": appointment.weight,
            "donationCenter": appointment.donationCenter
          },
          options: Options(
            headers: _headers,
            validateStatus: (status) {
              return status! < 500;
            },
          ));

      print(response);
      if (response.statusCode == 201) {
        return Appointment.fromJson(
            jsonDecode(jsonEncode(response.data['appointment'])));
      } else {
        print("creating Appointment ended ...");
        throw Exception("Could not create appointment");
      }
    } catch (e) {
      print("creating appointment failed");
      print(e);
      return Appointment(
          id: "id",
          userId: "userId",
          acceptorId: "acceptorId",
          startDate: "startDate",
          endDate: "endDate",
          status: "status",
          appointmentDescription: "appointmentDescription",
          weight: 10,
          createdAt: "createdAt",
          updatedAt: "updatedAt",
          donationCenter: "donationCenter");
    }
  }

  Future<Appointment> fetchOne(dynamic id) async {
    print("fetching Appointment start ... $_baseUrl/$id");

    try {
      final response = await Dio().get(
        '$_baseUrl/$id',
        options: Options(
          validateStatus: (status) {
            return status! < 500;
          },
          headers: {
            "accept": "/",
            // For latter use commented
            "Authorization":
                "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjVkN2E1MTRiNWQyYzEyYzc0NDliZTAyMCIsImlhdCI6MTYzMDkwOTE4OCwiZXhwIjo2MDAwMDAxNjMwOTA5MTg4fQ.40rcSvFHLaOewid4AlGIFWwNvEy6KbC5BiGihuJtRyQ",
            "Content-Type": "application/json"
          },
        ),
      );
      print(response.data["appointment"]);
      if (response.statusCode == 200) {
        return Appointment.fromJson(
            jsonDecode(jsonEncode(response.data["appointment"])));
      } else {
        throw Exception("fetching appointment by code failed");
      }
    } catch (e) {
      print("fetching appointment failed");
      print(e);
      return Appointment(
          id: "id",
          userId: "userId",
          acceptorId: "acceptorId",
          startDate: "startDate",
          endDate: "endDate",
          status: "status",
          appointmentDescription: "appointmentDescription",
          weight: 10,
          createdAt: "createdAt",
          updatedAt: "updatedAt",
          donationCenter: "donationCenter");
    }
  }

  Future<List<Appointment>> fetchAll() async {
    print("fetching Appointments start ...");
    try {
      final response = await Dio().get(
        '$_baseUrl/',
        options: Options(headers: _headers),
      );
      if (response.statusCode == 200) {
        final appointments =
            jsonDecode(jsonEncode(response.data["result"]["docs"]))
                as List<dynamic>;
        print(appointments.length);
        return appointments.map((a) => Appointment.fromJson(a)).toList();
      } else {
        throw Exception("fetching appointments by code failed");
      }
    } catch (e) {
      print("fetching appointments failed");
      print(e);
      return [
        Appointment(
            id: "id",
            userId: "userId",
            acceptorId: "acceptorId",
            startDate: "startDate",
            endDate: "endDate",
            status: "status",
            appointmentDescription: "appointmentDescription",
            weight: 10,
            createdAt: "createdAt",
            updatedAt: "updatedAt",
            donationCenter: "donationCenter")
      ];
    }
  }

  Future<List<Appointment>> fetchAllPending() async {
    print("fetching Pending Appointments start ...");
    try {
      final response = await Dio().get(
        '$_baseUrl/',
        options: Options(headers: _headers),
      );
      if (response.statusCode == 200) {
        final appointments =
            jsonDecode(jsonEncode(response.data["result"]["docs"]))
                as List<dynamic>;
        print(appointments.length);
        return appointments.map((a) => Appointment.fromJson(a)).toList();
      } else {
        throw Exception("fetching appointments by code failed");
      }
    } catch (e) {
      print("fetching appointments failed");
      print(e);
      return [
        Appointment(
            id: "id",
            userId: "userId",
            acceptorId: "acceptorId",
            startDate: "startDate",
            endDate: "endDate",
            status: "status",
            appointmentDescription: "appointmentDescription",
            weight: 10,
            createdAt: "createdAt",
            updatedAt: "updatedAt",
            donationCenter: "donationCenter")
      ];
    }
  }

  Future<Appointment> update(dynamic id, Appointment appointment) async {
    try {
      print("updating Appointment start ...");
      final response = await Dio().patch('$_baseUrl/$id',
          data: {
            "userId": appointment.userId,
            "acceptorId": appointment.acceptorId,
            "startDate": appointment.startDate,
            "endDate": appointment.endDate,
            "status": appointment.status,
            "appointmentDescription": appointment.appointmentDescription,
            "weight": appointment.weight,
            "donationCenter": appointment.donationCenter,
            "status": appointment.status,
          },
          options: Options(headers: _headers));
      if (response.statusCode == 200) {
        print(response.data);
        return Appointment.fromJson(jsonDecode(response.data));
      } else {
        print("updating Appointment ended ...");
        throw Exception("Could not update appointment");
      }
    } catch (e) {
      print("updating appointment failed");
      print(e);
      return Appointment(
          id: "id",
          userId: "userId",
          acceptorId: "acceptorId",
          startDate: "startDate",
          endDate: "endDate",
          status: "status",
          appointmentDescription: "appointmentDescription",
          weight: 10,
          createdAt: "createdAt",
          updatedAt: "updatedAt",
          donationCenter: "donationCenter");
    }
  }

  Future<void> delete(dynamic id) async {
    print("deleting appointment start...");
    final response = await Dio()
        .delete('$_baseUrl/$id', options: Options(headers: _headers));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete appointment");
    }
  }
}
