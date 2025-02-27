// Thought fetching service that gets a random thought 

import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {

  // List Datatype for easy retrieval
  static Future<List> fetchThought() async {
    final url = Uri.parse('http://api.quotable.io/random'); 

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        List result = [data['content'].toString(),data['author'].toString()];
        return result; 
      } else {
        return ['Error Fetching Thought','Request Unsuccessful'];
      }
    } catch (e) {
      return  ['Error Fetching Thought', e.toString()];
    }
  }
}
