import 'package:equatable/equatable.dart';
import 'package:my_application/models/Workmen_model.dart';

class WorkmenEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetWorkmens extends WorkmenEvent {
  final int projectId;

  GetWorkmens(this.projectId);
}
