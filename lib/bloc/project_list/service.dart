import 'dart:convert';
import 'package:my_application/global/global_variables.dart';
import 'package:my_application/models/project_model.dart';
import '../../helpers/http_helper.dart';
import '../bloc_service.dart';

class ProjectsService {
  Future<List<Project>> getProjects(int employeeId) async {
    // var rs = await HttpHelper.get(Uri.parse(PURCHASE_REQUEST_ENDPOINT),
    //     bearerToken: currentLogin.token);
    // print(rs.statusCode);
    // if (rs.statusCode == 200) {
    //   var jsonObject = jsonDecode(rs.body);
    //   var requests = List<Project>.from(
    //       [jsonObject].map((e) => Project.fromJson(e)));
    var projects = List<Project>.from([
      {
        "id": 1,
        "clientId": 1,
        "officeId": 1,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 22,
        "procurementOfficerId": 22,
        "name": "Luxurious 1, 1.5 & 2 BHK Apartments in Vikhroli.",
        "agreement": null,
        "startDate": "2022-05-27T00:00:00",
        "commencementDate": null,
        "estimateCost": 0,
        "totalCost": null,
        "orderAttachment": null,
        "status": "New",
        "client": {
          "id": 1,
          "businessId": 1,
          "addressId": 13,
          "name": "Demo Client",
          "email": "client@gmail.com",
          "phone": "9328832787",
          "gst": "823782378237872",
          "remark": null,
          "business": null,
          "address": null,
          "isActive": false,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:16:29.42",
          "updatedBy": 2,
          "updatedAt": "2022-05-27T20:33:27.177"
        },
        "office": null,
        "technicalHead": null,
        "procurementOfficer": null,
        "projectItems": [],
        "projectExpenses": [],
        "projectBanks": [],
        "projectLeads": [],
        "projectSupervisors": [],
        "projectContractors": [],
        "photos": [],
        "documents": [],
        "isActive": true,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:17:55.853",
        "updatedBy": 22,
        "updatedAt": "2022-06-08T18:10:41.36"
      },
      {
        "id": 2,
        "clientId": 1,
        "officeId": 1,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 22,
        "procurementOfficerId": 22,
        "name": "Eternia At Kalpataru Parkcity",
        "agreement": null,
        "startDate": "2022-05-27T00:00:00",
        "commencementDate": null,
        "estimateCost": 0,
        "totalCost": null,
        "orderAttachment": null,
        "status": "Completed",
        "client": {
          "id": 1,
          "businessId": 1,
          "addressId": 13,
          "name": "Demo Client",
          "email": "client@gmail.com",
          "phone": "9328832787",
          "gst": "823782378237872",
          "remark": null,
          "business": null,
          "address": null,
          "isActive": false,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:16:29.42",
          "updatedBy": 2,
          "updatedAt": "2022-05-27T20:33:27.177"
        },
        "office": null,
        "technicalHead": null,
        "procurementOfficer": null,
        "projectItems": [],
        "projectExpenses": [],
        "projectBanks": [],
        "projectLeads": [],
        "projectSupervisors": [],
        "projectContractors": [],
        "photos": [],
        "documents": [],
        "isActive": true,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:17:55.853",
        "updatedBy": 22,
        "updatedAt": "2022-06-08T18:10:41.36"
      },
      {
        "id": 3,
        "clientId": 1,
        "officeId": 1,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 22,
        "procurementOfficerId": 22,
        "name": "Dinaco Darshan CHSL",
        "agreement": null,
        "startDate": "2022-05-27T00:00:00",
        "commencementDate": null,
        "estimateCost": 0,
        "totalCost": null,
        "orderAttachment": null,
        "status": "New",
        "client": {
          "id": 1,
          "businessId": 1,
          "addressId": 13,
          "name": "Demo Client",
          "email": "client@gmail.com",
          "phone": "9328832787",
          "gst": "823782378237872",
          "remark": null,
          "business": null,
          "address": null,
          "isActive": false,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:16:29.42",
          "updatedBy": 2,
          "updatedAt": "2022-05-27T20:33:27.177"
        },
        "office": null,
        "technicalHead": null,
        "procurementOfficer": null,
        "projectItems": [],
        "projectExpenses": [],
        "projectBanks": [],
        "projectLeads": [],
        "projectSupervisors": [],
        "projectContractors": [],
        "photos": [],
        "documents": [],
        "isActive": true,
        "createdBy": 2,
        "createdAt": "2022-05-27T19:17:55.853",
        "updatedBy": 22,
        "updatedAt": "2022-06-08T18:10:41.36"
      }
    ].map((e) => Project.fromJson(e)));

    return projects;
    // }
    // return null;
  }

  Future<List<Project>> searchproject(String? search) async {
    if (![null, ""].contains(search)) {
      var projects = List<Project>.from([
        {
          "id": 1,
          "clientId": 1,
          "officeId": 1,
          "contractorIds": [],
          "supervisorIds": [],
          "leadIds": [],
          "bankIds": [],
          "technicalHeadId": 22,
          "procurementOfficerId": 22,
          "name": " Luxurious 1, 1.5 & 2 BHK Apartments in Vikhroli.",
          "agreement": null,
          "startDate": "2022-05-27T00:00:00",
          "commencementDate": null,
          "estimateCost": 0,
          "totalCost": null,
          "orderAttachment": null,
          "status": "New",
          "client": {
            "id": 1,
            "businessId": 1,
            "addressId": 13,
            "name": "Demo Client",
            "email": "client@gmail.com",
            "phone": "9328832787",
            "gst": "823782378237872",
            "remark": null,
            "business": null,
            "address": null,
            "isActive": false,
            "createdBy": 2,
            "createdAt": "2022-05-27T19:16:29.42",
            "updatedBy": 2,
            "updatedAt": "2022-05-27T20:33:27.177"
          },
          "office": null,
          "technicalHead": null,
          "procurementOfficer": null,
          "projectItems": [],
          "projectExpenses": [],
          "projectBanks": [],
          "projectLeads": [],
          "projectSupervisors": [],
          "projectContractors": [],
          "photos": [],
          "documents": [],
          "isActive": true,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:17:55.853",
          "updatedBy": 22,
          "updatedAt": "2022-06-08T18:10:41.36"
        },
        {
          "id": 2,
          "clientId": 1,
          "officeId": 1,
          "contractorIds": [],
          "supervisorIds": [],
          "leadIds": [],
          "bankIds": [],
          "technicalHeadId": 22,
          "procurementOfficerId": 22,
          "name": "Eternia At Kalpataru Parkcity",
          "agreement": null,
          "startDate": "2022-05-27T00:00:00",
          "commencementDate": null,
          "estimateCost": 0,
          "totalCost": null,
          "orderAttachment": null,
          "status": "Completed",
          "client": {
            "id": 1,
            "businessId": 1,
            "addressId": 13,
            "name": "Demo Client",
            "email": "client@gmail.com",
            "phone": "9328832787",
            "gst": "823782378237872",
            "remark": null,
            "business": null,
            "address": null,
            "isActive": false,
            "createdBy": 2,
            "createdAt": "2022-05-27T19:16:29.42",
            "updatedBy": 2,
            "updatedAt": "2022-05-27T20:33:27.177"
          },
          "office": null,
          "technicalHead": null,
          "procurementOfficer": null,
          "projectItems": [],
          "projectExpenses": [],
          "projectBanks": [],
          "projectLeads": [],
          "projectSupervisors": [],
          "projectContractors": [],
          "photos": [],
          "documents": [],
          "isActive": true,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:17:55.853",
          "updatedBy": 22,
          "updatedAt": "2022-06-08T18:10:41.36"
        },
        {
          "id": 3,
          "clientId": 1,
          "officeId": 1,
          "contractorIds": [],
          "supervisorIds": [],
          "leadIds": [],
          "bankIds": [],
          "technicalHeadId": 22,
          "procurementOfficerId": 22,
          "name": "Dinaco Darshan CHSL",
          "agreement": null,
          "startDate": "2022-05-27T00:00:00",
          "commencementDate": null,
          "estimateCost": 0,
          "totalCost": null,
          "orderAttachment": null,
          "status": "New",
          "client": {
            "id": 1,
            "businessId": 1,
            "addressId": 13,
            "name": "Demo Client",
            "email": "client@gmail.com",
            "phone": "9328832787",
            "gst": "823782378237872",
            "remark": null,
            "business": null,
            "address": null,
            "isActive": false,
            "createdBy": 2,
            "createdAt": "2022-05-27T19:16:29.42",
            "updatedBy": 2,
            "updatedAt": "2022-05-27T20:33:27.177"
          },
          "office": null,
          "technicalHead": null,
          "procurementOfficer": null,
          "projectItems": [],
          "projectExpenses": [],
          "projectBanks": [],
          "projectLeads": [],
          "projectSupervisors": [],
          "projectContractors": [],
          "photos": [],
          "documents": [],
          "isActive": true,
          "createdBy": 2,
          "createdAt": "2022-05-27T19:17:55.853",
          "updatedBy": 22,
          "updatedAt": "2022-06-08T18:10:41.36"
        }
      ].map((e) => Project.fromJson(e)).where((element) =>
          element.name!.toUpperCase().contains(search!.toUpperCase())));
      return projects;
    }
    return [];
  }
}
