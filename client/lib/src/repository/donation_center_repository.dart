import 'package:eshiblood/src/data_provider/donation_center_data.dart';
import 'package:meta/meta.dart';
import '../models/donation_center.dart';



class DonationCenterRepository {
  final DonationCenterDataProvider dataProvider;

  DonationCenterRepository({required this.dataProvider});

  Future<DonationCenter> createDonationCenter(DonationCenter donationCenter) async {
    return await dataProvider.createDonationCenter(donationCenter);
  }

  Future<List<DonationCenter>> getDonationCenters() async {
    return await dataProvider.getDonationCenters();
  }
  Future<DonationCenter> getDonationCenter(String id) async {
    return await dataProvider.getDonationCenter(id);
  }

  Future<void> updateDonationCenter(DonationCenter donationCenter) async {
    await dataProvider.updateDonationCenter(donationCenter);
  }

  Future<void> deleteDonationCenter(String id) async {
    await dataProvider.deleteDonationCenter(id);
  }
}
