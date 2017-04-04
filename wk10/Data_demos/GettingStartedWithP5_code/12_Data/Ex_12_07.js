var weatherData;

function preload() {
  //weatherData = loadJSON("cincinnati.json");
  var url = "http://api.openweathermap.org/data/2.5/weather?zip=11201,us";
  weatherData = loadJSON();
}

function setup() {
  var temp = getTemp(weatherData);
  console.log(temp);
}

function getTemp(data) {
  return data.list[0].main.temp;
}