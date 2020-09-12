# OpenWeatherMap Automation
## RobotFramework User Guide
https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html

## SeleniumLibrary Document
http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html  


## Install Python3 and pip3
- This requires python3 and pip3 to be installed first 

## Install plugin in Pycharm IDE
- Instructions:  
https://www.jetbrains.com/help/pycharm/managing-plugins.html  
- Plugins to install:
  - Robot Framework Support
  - IntelliBot @SeleniumLibrary Patched

## Setup Project Interpreter in Pycharm for your project
- Instructions: 
https://www.jetbrains.com/help/pycharm-edu/configuring-language-interpreter.html
- Select Python 3.7 as your interpreter

## To install required python libraries 

*__Example:__*     
`sudo pip install -r requirements.txt`

*__OR__*  
`sudo pip3 install -r requirements.txt`  

*__NOTES__*  
- Depends on your OS and how many Python version (2 or 3) on your local, you may need to use pip3 instead of pip
- If you are using Windows OS, no need to use sudo in above comments

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

3. Run by robot command directly
    - **Examples:**   
`robot -d Result_execution/single-thread --logtitle "Single Thread Test Log" --reporttitle "Single Thread Test Report" --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot
`

4. Parallel execution 
    - **Examples:**  
` pabot --testlevelsplit -d Result_execution/parallel --logtitle "Parallel Test Log" --reporttitle "Parallel Test Report"  --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot`
  
5. Verify execution results/reports
- RobotFramework reports will be placed under **Result_execution** folder
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

