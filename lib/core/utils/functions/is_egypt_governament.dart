bool isEgyptGovernorate(String gov) {
  List<String> egyptGovernorates = [
    "Cairo",
    "Giza",
    "Alexandria",
    "Dakahlia",
    "Red Sea",
    "Beheira",
    "Fayoum",
    "Gharbia",
    "Ismailia",
    "Menofia",
    "Minya",
    "Qaliubiya",
    "New Valley",
    "Suez",
    "Aswan",
    "Assiut",
    "Beni Suef",
    "Port Said",
    "Damietta",
    "Sharkia",
    "South Sinai",
    "Kafr El Sheikh",
    "Matruh",
    "Luxor",
    "Qena",
    "North Sinai",
    "Sohag"
  ];

  return egyptGovernorates
      .map((e) => e.toLowerCase())
      .contains(gov.toLowerCase());
}
