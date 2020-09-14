# OpenWeatherMap Automation
## RobotFramework User Guide
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

## SeleniumLibrary Document
http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html  


## Prerequisites
- python3 and pip3 are required to run this framework 
- nodejs and npm are required to run API testing plus Load Testing 


## Install plugin in Pycharm IDE
- Instructions:  
https://www.jetbrains.com/help/pycharm/managing-plugins.html  
- Plugins to install:
  - Robot Framework Support
  - IntelliBot @SeleniumLibrary Patched

## Setup Project Interpreter in Pycharm for your project
- Instructions: 
https://www.jetbrains.com/help/pycharm-edu/configuring-language-interpreter.html
- Select Python 3.7 or higher as your interpreter

## Install required libraries 
```
sudo pip3 install -r requirements.txt
npm i
```
 

*__NOTES__*  
- Depends on your OS and how many Python version (2 or 3) on your local, you may need to use `pip3` instead of `pip`
- If you are using Windows OS, no need to use `sudo` in above comments

## Setup broser driver to run UI test  
Run following command in your terminal 
`sudo webdrivermanager firefox chrome --linkpath /usr/local/bin`


## Run test locally
1. Open terminal (make sure you are under parent folder, not on any sub folder)  
2. Use script under __ExecutionScripts/local-Execution__ folder to run  
    2.1 Run a test suite file and exclude tests with tag __No Run__   
`ExecutionScripts\local-Execution\execution-NoRun.bat  <Relative path to test suite file>`  
    - **Examples:**  
`xecutionScripts\local-Execution\execution-NoRun.bat  Tests\AmazonTests.robot`  

   2.2. Run a test suite and just include a particular tag  
`ExecutionScripts\local-Execution\execution-by-tag.bat  <Relative path to test suite file> <tag_name> `  
    - **Examples:**     
`ExecutionScripts\local-Execution\execution-by-tag.bat  Tests\AmazonTests.robot  Smoke`    
  
    2.3. Run a test suite and just include a particular tag    
`ExecutionScripts\local-Execution\execution-by-tag.bat  <Relative path to test suite file> <tag_name> `  
    - **Examples:**     
`ExecutionScripts\local-Execution\execution-by-tag.bat  Tests\AmazonTests.robot  Smoke`

3. Run by `robot` command directly
    - **Examples:**   
`robot -d Result_execution/single-thread --logtitle "Single Thread Test Log" --reporttitle "Single Thread Test Report" --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot`

4. Parallel execution by replace `robot` with `pabot` in the execution command
    - **Examples:**  
`pabot --testlevelsplit -d Result_execution/parallel --logtitle "Parallel Test Log" --reporttitle "Parallel Test Report"  --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot`
  
5. Verify execution results/reports
- RobotFramework reports will be placed under **Result_execution** folder, just need to open `*report.html` or `*log.html`
- We can view Allure report for historical test status as well by generating from allure's log files under `test-results` folder  
```
 sudo apt-get intall allure -y 
 allure generate test-results -o allure-report
```

## Run test in Zalenium Docker
1. Make sure all the line ending type of all *.sh should be in LF (not CRLF of Windows)
2. Open terminal
3. Execute script __*run-test-in-docker.bat*__ 
4. Verify execution reports under **test-results** folder

## Run API Tests
1. Run Data Driven test 
`pabot -d api_results/  APIs/Tests/FindByCityDataDriven.robot.robot`

2. Run Modal Driven test 
`pabot -d api_results/ -v APP_URL:"http://localhost:7777" APIs/Tests/FindByCityDataDriven.robot.robot`

## Run Load Tests
1. Run With Web UI to monitor
`locust -f LoadTest/findByCityLoadTest.py  --host https://openweathermap.org -u 1000 -r 10 --step-load --step-users 50 --step-time 20s`

2. Run Without Web UI
`locust -f LoadTest/findByCityLoadTest.py --csv=example --host https://openweathermap.org --headless -u 100 -r 10 --run-time 60s --step-load --step-users 10 --step-time 10s`