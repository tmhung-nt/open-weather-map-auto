set workdir=%cd%

call docker pull tmhung62/python-test-runner
call docker pull elgalu/selenium

cls

echo "start zalenium"
call docker-compose up -d zalenium

echo "run test"
call docker-compose up --build robot

echo "Sleep 10 second(s)"
ping 127.0.0.1 -n 11 > nul

call docker-compose down


PAUSE