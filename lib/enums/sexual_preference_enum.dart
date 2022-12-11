enum SexualPreference {
  heteroSexual(0),
  gey(1),
  lesbian(2),
  bisexual(3),
  asexual(4),
  demisexual(5),
  pansexual(6),
  homosexual(7),
  questioning(8),
  dontMention(9);

  const SexualPreference(this.value);
  final int value;
}