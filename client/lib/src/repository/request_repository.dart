import 'package:eshiblood/src/data_provider/request_data.dart';
import 'package:meta/meta.dart';
import '../models/request.dart';



class RequestRepository {
  final RequestDataProvider dataProvider;

  RequestRepository({required this.dataProvider});

  Future<Request> createRequest(Request request) async {
    return await dataProvider.createRequest(request);
  }

  Future<List<Request>> getRequests() async {
    return await dataProvider.getRequests();
  }
  
  Future<Request> getRequest(String id) async {
    return await dataProvider.getRequest(id);
  }

  Future<void> updateRequest(Request request) async {
    await dataProvider.updateRequest(request);
  }

  Future<void> deleteRequest(String id) async {
    await dataProvider.deleteRequest(id);
  }
}
