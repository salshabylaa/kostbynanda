class City {
  final int id;
  final String name;
  final String imageUrl;
  final bool isPopular;

  // Constructor dengan default value untuk isPopular
  City({
    required this.id,        
    required this.name,      
    required this.imageUrl,  
    this.isPopular = false,  // Nilai default: false
  });
}
