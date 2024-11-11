class Payload {
  final String username;
  final int exp;
  final int origIat;

  Payload(this.username, this.exp, this.origIat);

  Payload.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        exp = json['exp'],
        origIat = json['origIat'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'exp': exp,
        'origIat': origIat,
      };
}
