class ApiConstance{
  static const String baseUrl = "https://api.themoviedb.org/3";

  static const String nowPlayingMoviePath = "$baseUrl/movie/now_playing?api_key=$apiKey";

  static const String pouplerMoviePath = "$baseUrl/movie/popular?api_key=$apiKey";

  static const String ReatedtopMoviePath = "$baseUrl/movie/top_rated?api_key=$apiKey";

  static  String MovieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=$apiKey";

  static  String RecommendationPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  static const String apiKey = "693206bfbb8c89b6777237dc264f37b6";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => '$baseImageUrl $path';
}