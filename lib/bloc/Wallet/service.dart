import 'package:my_application/models/wallet_model.dart';
import 'package:my_application/models/wallettransactions_model.dart';

class WalletService {
  var transasctions = List<WalletTransaction>.from([
    {
      "id": 9,
      "amount": 10000,
      "description": "Add Money",
      "walletId": 5,
      "date": "2022-06-23T17:20:21.307",
      "type": "Credit",
      "paymentType": "Cheque",
      "referenceNumber": "992899382892398",
      "projectId": null,
      "workmenId": null,
      "walletEmployeeId": 39,
      "creditedEmployeeId": 39,
      "creditedEmployee": null,
      "walletEmployee": null,
      "workmen": null,
      "project": null,
      "wallet": null
    },
    {
      "id": 10,
      "amount": 1000,
      "description": "advance",
      "walletId": 5,
      "date": "2022-06-24T18:19:17.3",
      "type": "Debit",
      "paymentType": "DebitCard",
      "referenceNumber": "98239898238",
      "projectId": 10,
      "workmenId": 9,
      "walletEmployeeId": 39,
      "creditedEmployeeId": null,
      "creditedEmployee": null,
      "walletEmployee": null,
      "workmen": {
        "id": 9,
        "bankId": 92,
        "businessId": 4,
        "departmentId": 3,
        "firstName": "RAMLAL",
        "lastName": "KUMAR",
        "designation": "LABOUR",
        "email": "ramlal@gmail.com",
        "mobile": "9882389289",
        "emergencyContact": "9389892389",
        "emergencyPerson": "vishal",
        "dailyRate": 500,
        "overtimeRate": null,
        "pan": "CDGASGH923",
        "aadharCard": "283998238923",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 39,
        "createdAt": "2022-06-23T15:04:55.4244263",
        "updatedBy": 40,
        "updatedAt": "2022-06-29T17:43:21.9940902"
      },
      "project": {
        "id": 10,
        "clientId": 8,
        "officeId": 15,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 39,
        "procurementOfficerId": 40,
        "name": "Jks contruction project ",
        "agreement": null,
        "startDate": "2022-06-23T00:00:00",
        "commencementDate": null,
        "estimateCost": 1000000,
        "totalCost": null,
        "orderAttachment": null,
        "status": "Active",
        "client": null,
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
        "createdBy": 39,
        "createdAt": "2022-06-23T15:05:55.45",
        "updatedBy": 40,
        "updatedAt": "2022-07-02T15:03:58.883"
      },
      "wallet": null
    },
    {
      "id": 11,
      "amount": 500,
      "description": "material",
      "walletId": 5,
      "date": "2022-06-25T14:45:54.857",
      "type": "Debit",
      "paymentType": "Cash",
      "referenceNumber": null,
      "projectId": 10,
      "workmenId": null,
      "walletEmployeeId": 39,
      "creditedEmployeeId": null,
      "creditedEmployee": null,
      "walletEmployee": null,
      "workmen": null,
      "project": {
        "id": 10,
        "clientId": 8,
        "officeId": 15,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 39,
        "procurementOfficerId": 40,
        "name": "Jks contruction project ",
        "agreement": null,
        "startDate": "2022-06-23T00:00:00",
        "commencementDate": null,
        "estimateCost": 1000000,
        "totalCost": null,
        "orderAttachment": null,
        "status": "Active",
        "client": null,
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
        "createdBy": 39,
        "createdAt": "2022-06-23T15:05:55.45",
        "updatedBy": 40,
        "updatedAt": "2022-07-02T15:03:58.883"
      },
      "wallet": null
    },
    {
      "id": 16,
      "amount": 100,
      "description": "Advance",
      "walletId": 5,
      "date": "2022-06-30T18:33:41.627",
      "type": "Debit",
      "paymentType": "Cash",
      "referenceNumber": null,
      "projectId": 10,
      "workmenId": 11,
      "walletEmployeeId": 39,
      "creditedEmployeeId": null,
      "creditedEmployee": null,
      "walletEmployee": null,
      "workmen": {
        "id": 11,
        "bankId": 93,
        "businessId": 4,
        "departmentId": 2,
        "firstName": "kamlesh",
        "lastName": "jadhav",
        "designation": "labour",
        "email": "kamlesh@gmail.com",
        "mobile": "9283982389",
        "emergencyContact": "9823893289",
        "emergencyPerson": "vishal",
        "dailyRate": 100,
        "overtimeRate": null,
        "pan": "SHDJS82989",
        "aadharCard": "828912898912",
        "bank": null,
        "department": null,
        "isActive": false,
        "createdBy": 40,
        "createdAt": "2022-06-29T17:44:22.8025496",
        "updatedBy": 39,
        "updatedAt": "2022-06-30T12:47:05.0785015"
      },
      "project": {
        "id": 10,
        "clientId": 8,
        "officeId": 15,
        "contractorIds": [],
        "supervisorIds": [],
        "leadIds": [],
        "bankIds": [],
        "technicalHeadId": 39,
        "procurementOfficerId": 40,
        "name": "Jks contruction project ",
        "agreement": null,
        "startDate": "2022-06-23T00:00:00",
        "commencementDate": null,
        "estimateCost": 1000000,
        "totalCost": null,
        "orderAttachment": null,
        "status": "Active",
        "client": null,
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
        "createdBy": 39,
        "createdAt": "2022-06-23T15:05:55.45",
        "updatedBy": 40,
        "updatedAt": "2022-07-02T15:03:58.883"
      },
      "wallet": null
    },
    {
      "id": 17,
      "amount": 2000,
      "description": "recharge",
      "walletId": 5,
      "date": "2022-06-30T18:34:58.11",
      "type": "Credit",
      "paymentType": "Cheque",
      "referenceNumber": "992899382892398",
      "projectId": null,
      "workmenId": null,
      "walletEmployeeId": 39,
      "creditedEmployeeId": 39,
      "creditedEmployee": null,
      "walletEmployee": null,
      "workmen": null,
      "project": null,
      "wallet": null
    }
  ].map((e) => WalletTransaction.fromJson(e)));

  Future<Wallet> getWallet(int employeeId) async {
    return Wallet(balance: 10400.00, id: 1, employeeId: 1);
  }

  Future<List<WalletTransaction>?> getTransactions(int employeeId) async {
    return transasctions;
  }
}
