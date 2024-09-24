import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:googleapis/servicecontrol/v1.dart' as servicecontrol;


class CommentsNotificationService{
  static const serviceAccountJson = {
    "type": "service_account",
    "project_id": "movie-streaming-8d839",
    "private_key_id": "1f866767c0a79e2bce76975df30e9a98e661c5bb",
    "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEuwIBADANBgkqhkiG9w0BAQEFAASCBKUwggShAgEAAoIBAQCA9IvyVmyUb5vq\n1NRDE1W10sW8rmftSS7xk+jZIspr22oNLTggmH+NFmM62Yd5AWhtIYVOlqoWr/cv\nm/vH3NA93IdhwbLD+5BDXvug+Kq8opIuawSFKNCwoSz1EDGSAARO6JGCC8wU7BGY\n9yMUlflTdx+ae7PFu3NQhmoVURLOd/t0PE+uU0ra8XgaM1rZJfMxIsT8rvzrQ8o+\nwTEKSfeyh+A4/Ksp1iO/i4Ng2Jjs08OHINHbc1fEkPgGL8CEfLD5/QP9Yg9oggC8\naxV8zVqMnjKNRnbjxLhzCZ/kcb4eRFSMosah6Akuy3MF2TLMqbG788GypsZzpDrf\nbV1yl7jbAgMBAAECgf9XJOtt2PmHVeUHzMukiGxjcwwtda7Fq68NkebI1bn1KVGB\nlg1X+bY4oehs3JOwMkNffEeZ1DcdHcztX3vGlHIlW+IhLcSgrF/RJ17kaSb4UuR2\neduUIQDmXAUFluvovhorOP8b4t0HRoCd3mTWhIL45Id23iGefg5vXGZUAXW0EGtK\n8FNR0zLfxXj1HmBmmQUdGCqmsjNB1d3odiffhL5iRml9Enwcifh3FVeq9ne6owhi\n4iHVYeYrpgMTW5slUpKiBguv4EDpYqbrPhaYG4hqW6jcYhCB29aynGsEBV7AK2wl\nIo+YR8G4Tll0MhsEo+POsX1bd+a9S/iut3zvOekCgYEAti2jhx0Pz6YG9C/AP9s3\njvrPURkff8zjSe1YSgc693l2Q8vHH0NJOk9751kbaZQaD8d/s0pC+f1wESV2ZYUx\nDM5W374sAIgBYnA7TL2KjhduSyXW8YRWHbNMRBZYi91cpbRrAFtgK5GxG5CMvhOX\n+Z9C6B/wNGUE3PKBeMzS1icCgYEAtTXKLkoDFYxERK/dJ4qMGqaegZVV/2hQClDs\ngeR3JtdgVzouL+ITcwzWLuVArxAP4ZZR7KyLByIQWrVDce2k2AdAg2FcnrqQD8of\nfwAUvOLZ91uIyZq8hTV0rb6mruRcVBzxLkJTjbSvshROlnDv0hXopDn9N3vVEQIZ\ng3+3zC0CgYBXZtn3rrexNcRMTsR7Xl7vV+Ey1UzJcbDx/M7I5WMi68ETkaZ8lzmA\nojWdrqB6LLW8MEhR6iTr7u1fLIv69MWtkSkYuxI9RwLzCUlJ7f2VYiRmJUdUI9t0\n8Fp8qAPfRlp2nXJgf3ZKMOG5icYcQyY8em4NE5WYbYbBwg7ft9THLQKBgEr/fDI0\nR5p/dzHGZ42Z9eqB01BmcjVHAvmCDKCl4fqdYS440izXMJ2JTowSLfdGeowvHrEJ\nqHDHVGV2Z/ebF4KhXb4Cacb4B+/BA9AYRHz4lqWdqLtn42ZufV/7bBkuQlg9skQn\nB1W61oypgu0YyOj2UFbH+VkhU0m6yLx3+6XxAoGBAKFizMB+nVqH92t4O5pManxJ\nELFTNthDygXGUwKjpmp7rlkIgoa2P+evaS3XO7iqnynCeewzUTL8HlpcbnDIQBTe\nCJb3+LFqB5hrOpOyc6EDUFEZyxBLMfnBroe3dsJpXTylwMvY3QyeqICndSTCDZ2T\ngyMEnbsE7mlTiuBtMTQG\n-----END PRIVATE KEY-----\n",
    "client_email": "movie-streaming-push@movie-streaming-8d839.iam.gserviceaccount.com",
    "client_id": "104939682938175065004",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/movie-streaming-push%40movie-streaming-8d839.iam.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  static Future<String> getAccessToken() async {
    List<String> scopes = [
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"
    ];

    final client = await auth.clientViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
    );

    final credentials = await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();

    return credentials.accessToken.data;
  }

  static Future<void> sendPushNotification(String deviceToken, String title,
      String body,) async {
    final String serverKey = await getAccessToken();
    String endpointFirebaseCloudMessaging =
        'https://fcm.googleapis.com/v1/projects/movie-streaming-8d839/messages:send';

    final Map<String, dynamic> message = {
      'message': {
        'token': deviceToken,
        'notification': {
          'title': title,
          'body': body,
        },

      }
    };
    final http.Response response = await http.post(
      Uri.parse(endpointFirebaseCloudMessaging),
      headers: <String, String>{
        'Authorization': 'Bearer $serverKey',
        'Content-Type': 'application/json',
      },
      body: jsonEncode(message),
    );
  }

}