```dart
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } on SocketException catch (e) {
    print('SocketException: $e');
    // Handle socket timeout errors
  } on TimeoutException catch (e) {
    print('TimeoutException: $e');
    // Handle timeout exceptions
  } on FormatException catch (e) {
    print('FormatException: $e');
    // Handle JSON decoding errors
  } catch (e) {
    print('General Error: $e');
    rethrow; // Rethrow for handling further up the call stack
  }
}
```