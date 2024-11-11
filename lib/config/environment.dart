import 'package:graphql/client.dart';
import 'constants.dart';

class Environment {
  static HttpLink httpLink = HttpLink(
    serverUrl,
    defaultHeaders: {
      'Authorization': 'Bearer lsdkjEwehwueWsdkjhDsdfeu',
      'x-environment': 'public'
    },
  );

  static setPrivateToken(String token) {
    httpLink.defaultHeaders['Authorization'] = 'JWT $token';
  }

  static setPublic() {
    httpLink.defaultHeaders['Authorization'] =
        'Bearer lsdkjEwehwueWsdkjhDsdfeu';
  }

  static setEnvironmentTestnet() {
    httpLink.defaultHeaders['x-environment'] = 'testnet';
  }

  static setEnvironmentPublic() {
    httpLink.defaultHeaders['x-environment'] = 'public';
  }

  static setEnvironment(bool isTestnet) {
    if (isTestnet) {
      setEnvironmentTestnet();
    } else {
      setEnvironmentPublic();
    }
  }
}
