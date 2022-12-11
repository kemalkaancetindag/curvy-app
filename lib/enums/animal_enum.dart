enum Animal {
  dog(0),
  cat(1),
  bird(2),
  reptile(3),
  fish(4),
  amphibic(5),
  dontHaveButLikes(6),
  wants(7),
  allergic(8),
  allPets(9),
  dontLike(10),
  afraid(11);

  const Animal(this.value);
  final int value;

}