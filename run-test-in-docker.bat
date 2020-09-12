set workdir=%cd%

call docker pull elgalu/selenium

cls

echo "start zalenium"
call docker-compose up -d zalenium

echo "run test"
call docker-compose run robot

echo "Sleep 5 second(s)"
ping 127.0.0.1 -n 6 > nul

call docker-compose down


PAUSE

