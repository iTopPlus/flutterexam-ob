import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLService {
  final GraphQLClient client;
  GraphQLService(this.client);

  Future<List<String>> fetchCustomer() async {
    await Future.delayed(const Duration(seconds: 1));
    final QueryOptions options = QueryOptions(
      document: gql(r'''
        query {
          customer
        }
      '''),
    );
    final QueryResult result = await client.query(options);
    return List<String>.from(result.data!['data']['customer']);
  }
}
