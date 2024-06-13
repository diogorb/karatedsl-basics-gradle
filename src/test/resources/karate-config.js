function fn() {
  var config = {
    urlBase: 'https://swapi.dev/api',
  };

  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}