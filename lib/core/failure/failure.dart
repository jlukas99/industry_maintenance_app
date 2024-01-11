import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.failureMessage});
  final String failureMessage;

  @override
  List<Object> get props => [failureMessage];
}
