import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:my_application/constatnts.dart';
import 'package:my_application/models/PurchaseRequest_model.dart';
import 'package:my_application/ui/screens/requestscreen.dart';

import '../../app_theme.dart';

var requests = List<PurchaseRequest>.from([
  {
    "id": 89,
    "orderNo": "2CU2ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-22",
    "note": null,
    "priority": 0,
    "orderStatus": 3,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 200,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 201,
        "name": "test",
        "description": null,
        "price": null,
        "unit": 2,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 29.92,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 5,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 3,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 5,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 3,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 5,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 3,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
  {
    "id": 90,
    "orderNo": "2CU34ENW-4/22/2022 5:31:12 PM",
    "name": null,
    "totalAmount": null,
    "deliveryAt": "2022-04-23",
    "note": null,
    "priority": 0,
    "orderStatus": 0,
    "employeeId": 10028,
    "projectId": 60,
    "reason": null,
    "orderItems": [
      {
        "id": 210,
        "name": "new",
        "description": null,
        "price": null,
        "unit": 1,
        "departmentId": null,
        "billId": null,
        "orderId": 89,
        "note": null,
        "quantity": 2.09,
        "department": null,
        "bill": null,
        "checked": false
      },
      {
        "id": 203,
        "name": "cement",
        "description": null,
        "price": null,
        "unit": 8,
        "departmentId": null,
        "billId": null,
        "orderId": 90,
        "note": null,
        "quantity": 209.00,
        "department": null,
        "bill": null,
        "checked": false
      }
    ],
    "employee": {
      "id": 10028,
      "userId": null,
      "businessId": 3,
      "code": "888",
      "addressId": null,
      "firstName": "vishal",
      "lastName": "chinta1",
      "email": "vishalch@business.com",
      "mobile": "8355952505",
      "home": "8355952505",
      "hourlyRate": null,
      "overtimeRate": null,
      "dob": "1999-01-01T00:00:00",
      "startDate": "2022-03-15T15:45:16.0514647",
      "address": null,
      "permissions": [],
      "isActive": false,
      "createdBy": 0,
      "createdAt": "2022-03-15T15:45:16.05",
      "updatedBy": 3,
      "updatedAt": "2022-03-31T17:59:50.99"
    },
    "project": {
      "id": 60,
      "clientId": 8,
      "officeId": 5,
      "contractorIds": [],
      "supervisorIds": [],
      "leadIds": [],
      "bankIds": [],
      "technicalHeadId": 10028,
      "procurementOfficerId": 10028,
      "name": "New Project ",
      "agreement": "372387237823",
      "startDate": "2022-03-12T00:00:00",
      "commencementDate": "2022-03-11T00:00:00",
      "estimateCost": 1212787128.71,
      "totalCost": 1000000000.21,
      "orderAttachment": null,
      "status": 1,
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
      "createdBy": 10012,
      "createdAt": "2022-02-25T21:21:53.73",
      "updatedBy": 10042,
      "updatedAt": "2022-04-18T19:56:24.3"
    },
    "createdBy": 10028,
    "createdAt": "2022-04-22T17:31:12",
    "updatedBy": 10028,
    "updatedAt": "2022-04-22T17:32:09.677"
  },
].map((e) => PurchaseRequest.fromJson(e)));

class Projects extends StatefulWidget {
  const Projects({Key? key, this.animationController}) : super(key: key);

  final AnimationController? animationController;
  @override
  _Projects createState() => _Projects();
}

class _Projects extends State<Projects> with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: Interval(0, 0.5, curve: Curves.fastOutSlowIn)));

    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 1;
    var animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController!,
        curve:
            const Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));

    listViews.add(AnimatedBuilder(
        animation: widget.animationController!,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
              opacity: animation,
              child: Transform(
                  transform: Matrix4.translationValues(
                      0.0, 30 * (1.0 - animation.value), 0.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Divider(
                          color: Color.fromRGBO(97, 99, 119, 1),
                        ),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height - 100,
                          width: MediaQuery.of(context).size.width - 40,
                          child: Column(children: [
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: ListTile(
                                dense: true,
                                title: const Text(
                                  "OrderNo",
                                  style: AppTheme.listheading,
                                ),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 60),
                                        child: Center(
                                          child: const Text("Date",
                                              style: AppTheme.listheading),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 0),
                                        child: Center(
                                            child: const Text(
                                          "Status",
                                          style: AppTheme.listheading,
                                        )),
                                      ),
                                    ]),
                              ),
                            ),
                            Expanded(child: Column(children: [_buildlist()]))
                          ]))
                    ],
                  )));
        }));
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 60.0),
          child: FloatingActionButton(
            backgroundColor: AppTheme.nearlyDarkBlue,
            elevation: 50,
            child: Icon(Icons.add),
            onPressed: () => {_openRequest(PurchaseRequest())},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 16 - 8.0 * topBarOpacity,
                            bottom: 12 - 8.0 * topBarOpacity),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Purchase Requests',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: AppTheme.fontName,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20 + 6 - 6 * topBarOpacity,
                                    letterSpacing: 1.2,
                                    color: AppTheme.darkerText,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 38,
                              width: 38,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(32.0)),
                                onTap: () {},
                                child: Center(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Icon(
                                      Icons.filter_alt,
                                      color: AppTheme.grey,
                                      size: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }

  Widget _buildlist() {
    var count = requests.length;
    var animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController!,
        curve: Interval((1 / count) * 0, 1.0, curve: Curves.fastOutSlowIn)));

    return Expanded(
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: requests.length,
            itemBuilder: (context, index) {
              return AnimatedBuilder(
                  animation: widget.animationController!,
                  builder: (BuildContext context, Widget? child) {
                    return FadeTransition(
                        opacity: animation,
                        child: Transform(
                            transform: Matrix4.translationValues(
                                0.0, 30 * (1.0 - animation.value), 0.0),
                            child: Card(
                                child: Container(
                              child: ListTile(
                                onTap: () {
                                  _openRequest(requests[index]);
                                },
                                title: SizedBox(
                                  child: Text(
                                    requests[index].orderNo.toString(),
                                    maxLines: 3,
                                  ),
                                ),
                                trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(right: 40),
                                          child: Text(DateFormat("dd-MM-yyyy")
                                              .format(requests[index]
                                                  .deliveryAt!))),
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: requests[index].status == 0
                                            ? Icon(
                                                FontAwesomeIcons.thumbsUp,
                                                color: Colors.green,
                                              )
                                            : requests[index].status == 3
                                                ? Icon(
                                                    FontAwesomeIcons
                                                        .circleXmark,
                                                    color: Colors.red,
                                                  )
                                                : Icon(
                                                    FontAwesomeIcons.hand,
                                                    color: Colors.grey,
                                                  ),
                                      ),
                                    ]),
                              ),
                            ))));
                  });
            }));
  }

  Future _openRequest(currentRequest) async {
    PurchaseRequest? request =
        await Navigator.of(context).push(new MaterialPageRoute<PurchaseRequest>(
            builder: (BuildContext context) {
              return new RequestScreen(request: currentRequest);
            },
            fullscreenDialog: true));
  }
}