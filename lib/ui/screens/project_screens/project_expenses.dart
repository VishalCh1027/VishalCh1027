import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/project_list/bloc.dart';
import 'package:my_application/bloc/project_list/service.dart';
import 'package:my_application/bloc/project_list/state.dart';
import 'package:my_application/models/expense_model.dart';

class ProjectExpenseScreen extends StatefulWidget {
  const ProjectExpenseScreen({Key? key}) : super(key: key);

  @override
  _ProjectExpenseScreen createState() => _ProjectExpenseScreen();
}

class _ProjectExpenseScreen extends State<ProjectExpenseScreen>
    with TickerProviderStateMixin {
  double topBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.appbarColor,
          iconTheme: const IconThemeData(color: Colors.black),
          title: Expanded(
            child: Text(
              'Expenses',
              textAlign: TextAlign.left,
              style: AppTheme.headline,
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              ProjectsCubit(repository: context.read<ProjectsService>())
                ..getExpense(1),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppTheme.secondaryColor,
                      ),
                    ),
                  ),
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 0,
                    child: ListTile(
                      dense: true,
                      title: const Text(
                        "Employee",
                        style: AppTheme.listheading,
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                            child: Center(
                              child: Text(
                                "Amount",
                                style: AppTheme.listheading,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(child: ExpenseListView()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpenseListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectsCubit, ProjectsState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == ProjectsStatus.projectsError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == ProjectsStatus.expenses) {
          return _buildlist(expenses: state.expenses);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _buildlist extends StatelessWidget {
  _buildlist({
    Key? key,
    required this.expenses,
  }) : super(key: key);

  List<ProjectExpense> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFEEEEEE),
              ),
            ),
          ),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            child: ListTile(
              onTap: () {},
              title: SizedBox(
                child: Text(
                  expenses[index].employee!.firstName! +
                      " " +
                      expenses[index].employee!.lastName!,
                  maxLines: 2,
                  style: AppTheme.body1,
                ),
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Reference No.:" +
                        (expenses[index].referenceNumber ?? "NA"),
                    style: AppTheme.caption,
                  ),
                  Text(
                    "invoice No.: " + (expenses[index].invoiceNumber ?? "NA"),
                    style: AppTheme.caption,
                  ),
                ],
              ),
              trailing: Container(
                width: 120,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    expenses[index].amount?.toString() ?? "NA",
                    overflow: TextOverflow.visible,
                    style: AppTheme.body1,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
