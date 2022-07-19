import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_application/apptheme/app_theme.dart';
import 'package:my_application/bloc/workmen_list/bloc.dart';
import 'package:my_application/bloc/workmen_list/service.dart';
import 'package:my_application/bloc/workmen_list/state.dart';
import 'package:my_application/ui/widgets/bottom_loader.dart';

class ProjectWorkmensPage extends StatefulWidget {
  const ProjectWorkmensPage({Key? key, required this.project})
      : super(key: key);
  final project;
  @override
  State<ProjectWorkmensPage> createState() => _ProjectWorkmensState();
}

class _ProjectWorkmensState extends State<ProjectWorkmensPage> {
  var projects = ["test project", "new project"];
  Animation<double>? topBarAnimation;
  double topBarOpacity = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: const Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Workmen',
                textAlign: TextAlign.left,
                style: AppTheme.headline,
              ),
            ),
          ),
        ),
        backgroundColor: AppTheme.background,
        body: BlocProvider(
          create: (_) =>
              WorkmenCubit(repository: context.read<WorkmenService>())
                ..getWorkmens(1),
          child: Stack(
            children: <Widget>[
              ListView.builder(
                padding: const EdgeInsets.only(),
                itemCount: 1,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18.0),
                      child: Divider(
                        color: Color.fromRGBO(97, 99, 119, 1),
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height - 100,
                            width: MediaQuery.of(context).size.width - 40,
                            child: Column(children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: AppTheme.primaryColor))),
                                child: Card(
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 0,
                                  child: const ListTile(
                                    dense: true,
                                    title: Text(
                                      "Name",
                                      style: AppTheme.listheading,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Column(children: [WorkmenListVIew()]))
                            ]))
                      ],
                    )
                  ]);
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

class WorkmenListVIew extends StatefulWidget {
  @override
  State<WorkmenListVIew> createState() => _buildlist();
}

class _buildlist extends State<WorkmenListVIew> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) context.read<WorkmenCubit>().getWorkmens(1);
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkmenCubit, WorkmenState>(
      buildWhen: (previous, current) => true,
      builder: (context, state) {
        if (state.status == WorkmenStatus.WorkmenError) {
          return const Center(child: Text('Oops something went wrong!'));
        } else if (state.status == WorkmenStatus.WorkmenLoaded ||
            state.status == WorkmenStatus.WorkmenEdited) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              controller: _scrollController,
              itemCount: state.hasReachedMax
                  ? state.workmens.length
                  : state.workmens.length + 1,
              itemBuilder: (context, index) {
                return index >= state.workmens.length
                    ? BottomLoader()
                    : Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: AppTheme.primaryColor))),
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0,
                          child: ListTile(
                            onTap: () {},
                            title: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                  state.workmens[index].firstname +
                                      " " +
                                      state.workmens[index].lastname,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTheme.body1),
                            ),
                          ),
                        ),
                      );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
