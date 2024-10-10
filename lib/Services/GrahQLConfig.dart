import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter/material.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink(
    'http://localhost/PHP/index.php',
  );


  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    ),
  );
}
