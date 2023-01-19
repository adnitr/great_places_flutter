const API_KEY =
    'pk.eyJ1IjoiYWRuaXRyIiwiYSI6ImNsZDJ3cWF1dzBjenEzdmwwOW9wMGMyZW4ifQ.ARcBjTSOvelXIJglVnTCpw';

class LocationHelper {
  static String generateLocationPreviewImage(
      double latitude, double longitude) {
    return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/$longitude, $latitude,16,0/300x200?access_token=$API_KEY';
  }
}
