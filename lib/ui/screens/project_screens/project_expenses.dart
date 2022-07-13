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

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: Expanded(
            child: Text(
              'Expenses',
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
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (_) =>
              ProjectsCubit(repository: context.read<ProjectsService>())
                ..getExpense(1),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                padding: const EdgeInsets.only(),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: AppTheme.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color:
                                AppTheme.grey.withOpacity(0.4 * topBarOpacity),
                            offset: const Offset(1.1, 1.1),
                            blurRadius: 10.0),
                      ],
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Container(
                        width: MediaQuery.of(context).size.width - 20,
                        height: MediaQuery.of(context).size.height - 100,
                        child: Column(
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xFFEEEEEE)))),
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
                            Expanded(
                                child: Column(children: [ExpenseListView()]))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).padding.bottom,
              )
            ],
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
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: expenses.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: const BoxDecoration(
                border:
                    const Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
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
                    maxLines: 3,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              expenses[index].amount?.toString() ?? "NA",
                              overflow: TextOverflow.visible,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
