*** Settings ***
Documentation  This is the global data repository to use while executing testcases
Resource       R_Common.robot

*** Variables ***
${HOME_PAGE_URL}                ${APP_URL}
${INTRODUCTION_TXT}             Weather forecasts, nowcasts and history in fast and elegant way
${WEATHER_WIDGET}               id=weather-widget