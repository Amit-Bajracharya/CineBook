import 'package:http/http.dart' as http;
import 'dart:convert';


class ApiService {
  static const String baseUrl = 'http://192.168.1.8:5000/user/api'; // Replace with your IP

  static Future<Map<String, dynamic>> createUser({
      required String username,
      required String email,
      required String password,
      required String phone_number,
  })async{
    try{
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {
          'Content-type' : 'application/json'
        },
        body: jsonEncode({
          'username': username,
          'email': email,
          'password':  password,
          'phone_number' : phone_number

        }),
      );

      if(response.statusCode == 200){
        final responseData = jsonDecode(response.body);
        print('Response data: $responseData'); // Debug print
        return {
          'success': true,
          'data' : responseData
        };
      }else{
        print('Error response: ${response.body}'); // Debug print
        return {
          'success' : false,
          'error'  : jsonDecode(response.body)['data'] ?? 'Unknown error'
        };
      }
    }catch(err){
      return {
        'success': false, 
        'data' :  'Network Error: $err' 
      };
    }
  }

static Future<Map<String, dynamic>> getAllUsers() async{
  try{
    final res = await http.get(
      Uri.parse(baseUrl),
      headers: {
        'Content-type' : 'application/json'
      },
    );
    if(res.statusCode == 200 )
{
    return {
      'success' : true,
      'data' : jsonDecode(res.body)
    };
} else{
  return {
    'success' : false,
    'data ': jsonDecode(res.body)['data'] ?? 'Unknown Error'
  };
}

 }catch(err){
      return {
        'success' : false,
        'data ': 'Error: $err'
      };
  }
}

//LOGIN USER
static Future <Map<String, dynamic>> loginUser({
  required email,
  required password
}) async{
  try{
    final res =await http.post(
      Uri.parse(baseUrl),
      headers: {
        'Content-type' : 'application/json'
      },
      body: jsonEncode({
        'email' : email,
        'password' : password
      }),
    );
    if(res.statusCode == 200){
      return {
        'success' : true,
        'data' : jsonDecode(res.body)
      };
    }
    else{
      return {
        'success' :false,
        'data' : jsonDecode(res.body)['data' ] ?? 'Unknown Error'
      };
    }
  }
  catch(err){
    return {
      'success' : false,
      'data' : 'Error : $err'
    };
  }
}
}

