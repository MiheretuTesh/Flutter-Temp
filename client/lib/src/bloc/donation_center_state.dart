part of 'donation_center_bloc.dart';

@immutable
abstract class DonationCenterState {}

class DonationCenterLoading extends DonationCenterState {}
class DonationCenterLoadSuccess extends DonationCenterState {
  List<DonationCenter> donationCenters=[];
  DonationCenterLoadSuccess(this.donationCenters);
}
class DonationCenterOperationFailure extends DonationCenterState {}

