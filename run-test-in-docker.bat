set workdir=%cd%

call docker pull tmhung62/python-test-runner
call docker pull elgalu/selenium

cls

echo "start zalenium hub"
call docker-compose up -d hub

echo "run test"
call docker-compose up --build robot

echo "Sleep 5 second(s)"
ping 127.0.0.1 -n 5 > nul

call docker-compose down


PAUSE