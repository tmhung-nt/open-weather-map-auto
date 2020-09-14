const cities = require('all-the-cities');

const randomCityName = () => {

    const citi_names = cities.map(city => city.name + ', ' + city.country);
    
    return encodeURI(citi_names[Math.floor(Math.random() * citi_names.length)]);
}

const randomGoodbye = () => {
  return `Goodbye, I will be back on ${faker.date.weekday()}`;
}

module.exports.getRandomCityName = (userContext, events, done) => {
  userContext.vars.cityName = randomCityName();
  done();
};
