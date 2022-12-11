enum Sex {
  women(0),
  men(1),
  lgbtq(2),
  notMention(3);

  const Sex(this.value);
  final int value;
}