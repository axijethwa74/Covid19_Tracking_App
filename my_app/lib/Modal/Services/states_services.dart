import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_app/Modal/Services/Utilities/api_url.dart';
import 'package:my_app/Modal/Services/world_states_modal.dart';

class StateServices {
  Future<WorldStatesModel> fetchWorldApi() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception("Error");
    }
  }
}
