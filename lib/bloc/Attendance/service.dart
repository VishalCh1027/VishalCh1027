import 'dart:convert';

import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/attendance_model.dart';
import 'package:my_application/models/loginmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../helpers/http_helper.dart';
import '../../helpers/local_helper.dart';
import '../bloc_service.dart';

class AttendanceService extends BlocService<Attendance> {
  @override
  Future<Attendance> get(int id) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<Attendance>?> getAll({int from = 0, int? limit}) async {
    // TODO: implement getAll
    var rs = await HttpHelper.get(Uri.parse(ATTENDANCE_ENDPOINT),
        bearerToken: currentLogin.token);
    if (rs.statusCode == 200 || rs.statusCode == 201) {
      var jsonArray = jsonDecode(rs.body) as List;
      var favorites =
          jsonArray.map((json) => Attendance.fromJson(json)).toList();
      return favorites;
    }
    return null;
  }

  Future<List<Attendance>?> getWorkmens(String projectId) async {
    var rs = await HttpHelper.post(Uri.parse(WORKMENS_ENDPOINT), {},
        bearerToken: currentLogin.token);
    print(rs.statusCode);
    if (rs.statusCode == 200) {
      var jsonObject = jsonDecode(rs.body);
      var workmens = List<Attendance>.from(
          [jsonObject].map((e) => Attendance.fromJson(e)));

      return workmens;
    }
    return null;
  }
}
