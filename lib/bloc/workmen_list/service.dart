import 'dart:convert';
import 'dart:math';

import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/attendance_model.dart';
import 'package:my_application/models/workmen_model.dart';
import '../../helpers/http_helper.dart';
import '../bloc_service.dart';

const _postLimit = 15;

class WorkmenService extends BlocService<Workmen> {
  var workmens = List<Workmen>.from([
    {
      "id": 1,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "vinod lakhavathula kumar varun",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 2,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "Abhinav",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 3,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "Pankaj",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 4,
      "bankId": 236,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "komal",
      "lastName": "I",
      "designation": "IT",
      "email": "komal@gmail.com",
      "mobile": "9839832889",
      "emergencyContact": "2893298893",
      "emergencyPerson": "rahul",
      "dailyRate": 3283872.38,
      "overtimeRate": 3896598.59,
      "pan": "8932832898",
      "aadharCard": "3889238932898932",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:35:21.3283332",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.7674043"
    },
    {
      "id": 20,
      "bankId": 218,
      "businessId": 3,
      "departmentId": 7,
      "firstName": "Atul",
      "lastName": "test",
      "designation": "labour",
      "email": "tes@gmail.com",
      "mobile": "9283923898",
      "emergencyContact": "8298238238",
      "emergencyPerson": "vishal",
      "dailyRate": null,
      "overtimeRate": 2378.72,
      "pan": "ghsghd2898",
      "aadharCard": "2372636236732676",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-21T19:54:53.7915674",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:36.5767997"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Akshay",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Manoj",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Ajay",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Ramesh",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Suresh",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 21,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Ajay",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 22,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Ajay",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 23,
      "bankId": 219,
      "businessId": 3,
      "departmentId": 5,
      "firstName": "Ajay",
      "lastName": "test",
      "designation": "test",
      "email": "tst@gmail.com",
      "mobile": "9832989238",
      "emergencyContact": "2382389238",
      "emergencyPerson": "vishal",
      "dailyRate": 289328.98,
      "overtimeRate": 238787.37,
      "pan": "2332877872",
      "aadharCard": "3287327732783278",
      "bank": null,
      "department": null,
      "isActive": false,
      "createdBy": 3,
      "createdAt": "2022-03-22T14:05:11.0853499",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T20:54:12.4815173"
    },
    {
      "id": 35,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "karan kumar",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 36,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "sidharth malhotra",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 1,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "jitin yadav",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 1,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "mahesh shetty",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 1,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "shruthi otham",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 1,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "mahima shukla",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 40,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "manoj jigar",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 41,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "naved shaikh",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 42,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "nayar deepak",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
    {
      "id": 42,
      "bankId": 205,
      "businessId": 3,
      "departmentId": 1,
      "firstName": "dhiraj karan",
      "lastName": "h",
      "designation": "IT",
      "email": "shruti@gmail.com",
      "mobile": "9328893289",
      "emergencyContact": "9889437883",
      "emergencyPerson": "vishal",
      "dailyRate": 3232787.83,
      "overtimeRate": 9328893.28,
      "pan": "3273278328",
      "aadharCard": "3289328989238989",
      "bank": null,
      "department": null,
      "isActive": true,
      "createdBy": 3,
      "createdAt": "2022-03-15T14:30:48.3415659",
      "updatedBy": 3,
      "updatedAt": "2022-04-18T21:15:44.051939"
    },
  ].map((e) => Workmen.fromJson(e)));

  Future<List<Workmen>> getWorkmens(int projectId, [int startindex = 0]) async {
    // var rs = await HttpHelper.post(Uri.parse(WORKMENS_ENDPOINT), {},
    //     bearerToken: currentLogin.token);
    // print(rs.statusCode);
    // if (rs.statusCode == 200) {
    //   var jsonObject = jsonDecode(rs.body);
    //   var workmens = List<Workmen>.from(
    //       [jsonObject].map((e) => Workmen.fromJson(e)));

    //   return workmens;
    // }
    // return null;

    return workmens
        .getRange(startindex, min(workmens.length, startindex + _postLimit))
        .toList();
  }

  Future<Object?> editWorkmen(List<Workmen> Workmens) async {
    try {
      var rs = await HttpHelper.post(Uri.parse(WORKMENS_ENDPOINT), {},
          bearerToken: currentLogin.token);
      print(rs.statusCode);
      if (rs.statusCode == 200) {
        var jsonObject = jsonDecode(rs.body);

        return jsonObject;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<List<Workmen>> searchWorkmen(String? search) async {
    if (![null, ""].contains(search)) {
      return workmens;
    }
    return [];
  }

  Future<Object?> editAttendance(List<Attendance> attendances) async {
    try {
      var rs = await HttpHelper.post(Uri.parse(ATTENDANCE_ENDPOINT), {},
          bearerToken: currentLogin.token);
      if (rs.statusCode == 200) {
        var jsonObject = jsonDecode(rs.body);
        return jsonObject;
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<Object?> transferWorkmen(int projectId, int workmenId) async {
    try {
      var rs = await HttpHelper.post(Uri.parse(WORKMEN_TRANSFER_ENDPOINT),
          {"project": projectId, "workmenId": workmenId},
          bearerToken: currentLogin.token);
      if (rs.statusCode == 200) {
        var jsonObject = jsonDecode(rs.body);

        return jsonObject;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}
