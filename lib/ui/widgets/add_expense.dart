import 'dart:ffi';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/Wallet/service.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/models/orderItem_model.dart';
import 'package:my_application/models/project_model.dart';
import 'package:my_application/models/wallettransactions_model.dart';
import 'package:my_application/models/workmen_model.dart';

class AddExpensePage extends StatefulWidget {
  AddExpensePage({Key? key, this.expense});
  final WalletTransaction? expense;
  @override
  State<AddExpensePage> createState() => _AddExpensePage(expense);
}

class _AddExpensePage extends State<AddExpensePage> {
  _AddExpensePage(this.expense);

  final WalletTransaction? expense;
  var isSaving = true;
  WalletTransaction _item = WalletTransaction.empty();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initState() {
    _item = expense ?? WalletTransaction.empty();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppTheme.background,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: AppTheme.background,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.clear_rounded,
            color: AppTheme.nearlyBlack,
          ),
        ),
        title: const Text(
          'Expense',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: AppTheme.fontName,
            fontWeight: FontWeight.w700,
            fontSize: 22 + 6 - 6,
            letterSpacing: 1.2,
            color: AppTheme.darkerText,
          ),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true, // this is new
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 25, right: 25, top: 25, bottom: 0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    DropdownSearch<Project>(
                      popupSafeArea: PopupSafeAreaProps(top: false),
                      mode: Mode.BOTTOM_SHEET,
                      showSearchBox: true,
                      isFilteredOnline: true,
                      onFind: (String? filter) {
                        var projects =
                            RepositoryProvider.of<ProjectsService>(context)
                                .searchproject(filter);
                        return projects;
                      },
                      itemAsString: (Project? u) {
                        return u?.name ?? "";
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select project';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _item.projectId = value?.id;
                      },
                      dropdownSearchDecoration: const InputDecoration(
                        icon: Icon(
                          Icons.person,
                          color: AppTheme.primaryColor,
                        ),
                        labelText: 'Select Project',
                        labelStyle: TextStyle(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: _item.paymentType != null
                          ? _item.paymentType.toString()
                          : null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Amount';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        _item.amount = double.tryParse(value);
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.production_quantity_limits_rounded,
                          color: AppTheme.primaryColor,
                        ),
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: _item.description,
                      onChanged: (value) {
                        _item.description = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter description';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.info_outline_rounded,
                          color: AppTheme.primaryColor,
                        ),
                        labelText: 'Description',
                        labelStyle: TextStyle(
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ),
                    DropdownButtonFormField(
                        elevation: 2,
                        value: _item.paymentType,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select payment type';
                          }
                          return null;
                        },
                        items: PaymentType.values.map((item) {
                          return new DropdownMenuItem<String>(
                            value: item.name.toString(),
                            child: new Text(
                              item.name.toString(),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _item.paymentType = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.linear_scale_rounded,
                              color: AppTheme.primaryColor,
                            ),
                            labelText: "Payment Type",
                            labelStyle:
                                TextStyle(color: AppTheme.primaryColor))),
                    DropdownButtonFormField(
                        elevation: 2,
                        validator: (value) {
                          if (value == null) {
                            return 'Please select category';
                          }
                          return null;
                        },
                        items: const [
                          DropdownMenuItem<String>(
                            value: "Material",
                            child: Text(
                              "Material",
                            ),
                          ),
                          DropdownMenuItem<String>(
                            value: "Labour",
                            child: Text(
                              "Labour",
                            ),
                          )
                        ],
                        onChanged: (value) {
                          setState(() {
                            _item.category = value.toString();
                          });
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.linear_scale_rounded,
                              color: AppTheme.primaryColor,
                            ),
                            labelText: "Category",
                            labelStyle:
                                TextStyle(color: AppTheme.primaryColor))),
                    if (_item.projectId != null && _item.category == "Labour")
                      DropdownSearch<Workmen>(
                        mode: Mode.BOTTOM_SHEET,
                        showSearchBox: true,
                        isFilteredOnline: true,
                        onFind: (String? filter) {
                          var projects =
                              RepositoryProvider.of<WorkmenService>(context)
                                  .searchWorkmen(filter);
                          return projects;
                        },
                        itemAsString: (Workmen? u) {
                          return u == null
                              ? ""
                              : (u.firstname + " " + u.lastname);
                        },
                        validator: (value) {
                          if (_item.projectId != null &&
                              _item.category == "Labour") {
                            if (value == null) {
                              return 'Please select Workmen';
                            }
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _item.projectId = value?.id;
                        },
                        dropdownSearchDecoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: AppTheme.primaryColor,
                          ),
                          labelText: 'Select Workmen',
                          labelStyle: TextStyle(
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                    SizedBox(
                      height: 20,
                    ),
                    _buildSavebutton(context)
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
            ),
          ],
        ),
      ),
    );
  }

  void saveTransaction() async {
    isSaving = false;
    var check = formKey.currentState!.validate();
    if (check) {
      var response = await RepositoryProvider.of<WalletService>(context)
          .SaveTransaction(_item);

      if (response != null) {
        Navigator.of(context).pop(_item);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text("Failed to save transaction"),
          ),
        );
        isSaving = true;
      }
    }
  }

  Widget _buildSavebutton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppTheme.primaryColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      onPressed: () async {
        if (isSaving) {
          saveTransaction();
        }
      },
      child: const SizedBox(
        width: 300,
        height: 30,
        child: Center(
          child: Text(
            'Save',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
