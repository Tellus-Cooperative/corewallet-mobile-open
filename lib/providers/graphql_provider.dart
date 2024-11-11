import 'package:graphql/client.dart';

import '../config/environment.dart';

GraphQLClient getGraphQLClient({required String service, String? token = ''}) {
  String currentUri = Environment.httpLink.uri.toString();
  if (Environment.httpLink.uri.toString().contains('?')) {
    var uriList = Environment.httpLink.uri.toString().split('?');
    currentUri = uriList[0];
  }

  HttpLink httpLink = HttpLink(
    '$currentUri?$service',
    defaultHeaders: Environment.httpLink.defaultHeaders,
  );

  return GraphQLClient(cache: GraphQLCache(), link: httpLink,);
}
