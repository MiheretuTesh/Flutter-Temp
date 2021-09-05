import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eshiblood/src/models/donation_center.dart';
import 'package:eshiblood/src/repository/donation_center_repository.dart';
import 'package:meta/meta.dart';

part 'donation_center_event.dart';
part 'donation_center_state.dart';

class DonationCenterBloc extends Bloc<DonationCenterEvent, DonationCenterState> {
  final DonationCenterRepository donationCenterRepository;
  DonationCenterBloc({required this.donationCenterRepository}) : super(DonationCenterLoading());

  @override
  Stream<DonationCenterState> mapEventToState(DonationCenterEvent event) async* {
    if (event is DonationCenterLoad){
      yield DonationCenterLoading();
      try {
        final donationCenters = await donationCenterRepository.getDonationCenters();
        yield DonationCenterLoadSuccess(donationCenters);
      } catch (e) {
        yield DonationCenterOperationFailure();
      }
    }
    if (event is DonationCenterCreate){
      yield DonationCenterLoading();
      try {
        await donationCenterRepository.createDonationCenter(event.donationCenter);
        final donationCenters = await donationCenterRepository.getDonationCenters();
        yield DonationCenterLoadSuccess(donationCenters);
      } catch (e) {
        yield DonationCenterOperationFailure();
      }
    }
    if (event is DonationCenterUpdate){
      yield DonationCenterLoading();
      try {
        await donationCenterRepository.updateDonationCenter(event.donationCenter);
        final donationCenters = await donationCenterRepository.getDonationCenters();
        yield DonationCenterLoadSuccess(donationCenters);
      } catch (e) {
        yield DonationCenterOperationFailure();
      }
    }
    if (event is DonationCenterDelete){
      yield DonationCenterLoading();
      try {
        await donationCenterRepository.deleteDonationCenter(event.donationCenter.id??"");
        final donationCenters = await donationCenterRepository.getDonationCenters();
        yield DonationCenterLoadSuccess(donationCenters);
      } catch (e) {
        yield DonationCenterOperationFailure();
      }
    }
  }
}
