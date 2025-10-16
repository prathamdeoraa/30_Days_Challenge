class Location {
  final Streets street;
  final String city;
  final String country;
  final String state;
  // final String postcode;
  // final String coordinates;
  final TimeZone timezone;

  Location({
    required this.street,
    required this.city,
    required this.country,
    required this.state,
    required this.timezone,
    // required this.postcode,
    // required this.coordinates,
  });

  factory Location.fromMap(Map<String, dynamic> e) {
    final timezone = TimeZone(
      offset: e['timezone']['offset'],
      description: e['timezone']['description'],
      // postcode: e['location']['postcode'],
    );

    final street = Streets(
      name: e['street']['name'],
      number: e['street']['number'],
    );

    return Location(
      city: e['city'],
      country: e['country'],
      state: e['state'],
      timezone: timezone,
      street: street,
      // postcode: e['location']['postcode'],
    );
  }
}

class TimeZone {
  final String offset;
  final String description;

  TimeZone({required this.offset, required this.description});
}

class Streets {
  final int number;
  final String name;

  Streets({required this.name, required this.number});
}
