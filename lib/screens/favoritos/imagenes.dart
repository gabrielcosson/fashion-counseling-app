class Imagen {
  final String imagen;
  final String id;
  bool isLiked;

  Imagen(this.imagen, this.id, this.isLiked);
}

List<Imagen> imagenes = [
  Imagen(
    "assets/outfits/outfit1.jpg",
    "1",
    true,
  ),
  Imagen(
    "assets/outfits/outfit2.jpg",
    "2",
    true,
  ),
  Imagen(
    "assets/outfits/outfit3.jpg",
    "3",
    false,
  ),
  Imagen(
    "assets/outfits/outfit4.jpg",
    "4",
    false,
  ),
  Imagen(
    "assets/outfits/outfit5.jpg",
    "5",
    false,
  ),
];
