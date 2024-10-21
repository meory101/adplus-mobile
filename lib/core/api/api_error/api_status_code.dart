/**
 * Created by Eng.Eyad AlSayed on 2/27/2024.
 */

abstract class ApiStatusCode{
  static List<int> success()=> [200,201];
  static int invalidSessionToken() => 209;
  static int serverError() => 500;
  static int badRequest() => 400;
}