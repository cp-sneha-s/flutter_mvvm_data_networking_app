

import 'package:http/http.dart';
import 'package:networking_example_app/networking/person_client.dart';
import 'package:networking_example_app/networking/request_type.dart';

class remotedataSource{
  PersonClient client = PersonClient(Client());
  Future<Result> getPerson()async{
    final response = await client.request(requestType: RequestType.GET)
        if(response.statusCode == 200){
          return Result<Person>.success
        }
  }
}