enum ProfileUpdateFields {
  zodiac('zodiac'),
  personType('person_type'),
  petPreference('pet_preference'),
  smokePreference('smoke_preference'),
  alcholPreference('alchol_preference'),
  sex('sex'),
  sexualPreference('sexual_preference'),
  showAge('show_age'),
  showDistance('show_distance');

  const ProfileUpdateFields(this.value);
  final String value;
}