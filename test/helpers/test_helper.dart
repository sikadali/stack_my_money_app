import "package:http/http.dart" as http;
import "package:mockito/annotations.dart";
import "package:stack_my_money_app/src/businesslogic/repositories/transaction_repository.dart";

@GenerateMocks([TransactionRepository], customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
