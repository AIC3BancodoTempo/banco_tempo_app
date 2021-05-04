part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

class ServiceInitial extends ServiceState {}

class LoadingServiceState extends ServiceState {}

class ShowServiceState extends ServiceState {
  final List<ServiceModel> serviceList;

  ShowServiceState({@required this.serviceList});
}

class UpdateServiceState extends ServiceState {
  final List<ServiceModel> serviceList;

  UpdateServiceState({@required this.serviceList});
}
