part of 'cat_fact_bloc.dart';

abstract class CatFactState extends Equatable {}

class CatFactInitial extends CatFactState {
  @override
  List<Object?> get props => [];
}

class CatFactLoading extends CatFactState {
  @override
  List<Object?> get props => [];
}

class CatFactSuccess extends CatFactState {
  final CatModel catModel;

  CatFactSuccess({required this.catModel});
  @override
  List<Object?> get props => [catModel];
}

class CatFactError extends CatFactState {
  final String error;

  CatFactError(this.error);
  @override
  List<Object?> get props => [error];
}
