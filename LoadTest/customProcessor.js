const cities = require('all-the-cities');

const getRandomFromArray = (_array) => {
  return _array[Math.floor(Math.random() * _array.length)];
}

const randomCityName = () => {
      const cityList = [
        'nha trang, vn', 'Esbjerg', 'Horsens', 'Kolding', 'Silkeborg', 'Ringsted', 'Skive', 'Varde',
        'Hajjah', 'Aden', 'Al Hudaydah'
      ];
    const city_names = cities.map(city => {
      const name = city.name.match("^[A-Za-z]+$"); 
      return name ? city.name + ',' + city.country : getRandomFromArray(cityList);
    });
    const random_name = getRandomFromArray(city_names);
    
    return random_name;
}

const encodeString = (_input) => {
  return encodeURI(_input);
}

module.exports.getRandomCityName = (userContext, events, done) => {
  userContext.vars.cityName = randomCityName();
  userContext.vars.cityNameEncode = encodeString(userContext.vars.cityName);
  done();
};
