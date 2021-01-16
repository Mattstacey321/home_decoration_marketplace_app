String getProductType(String type) {
  switch (type) {
    case "decorative-accessories":
      return "Accessories";
      break;
    case "light-decor":
      return "Light";
      break;
    case "mirror-decor":
      return "Mirror";
      break;
    case "throw-decor":
      return "Pillow";
      break;
    case "wall-decor":
      return "Wall";
      break;
    case "plant":
      return "Plant";
      break;
    case "paint":
      return "Paint";
      break;
    case "statue-sculpture":
      return "Statue";
      break;
    case "art":
      return "Art";
      break;
    default:
      return "NaN";
  }
}
