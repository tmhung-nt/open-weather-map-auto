# OpenWeatherMap Automation

## Run test with Docker (To integrate with CI tools)
1. Open terminal
2. Execute script __*run-test-in-docker.sh*__
- This script will execute tests that are listed under __*ExecutionScripts/docker-execution/toBeExecuted*__ folder  
- By default, UI, API and LoadTesting scripts will be executed  
- If you want to run more tests, just need to edit the existing scripts under that folder or add new bash script for your required test suite
- To exclude some tests out of Docker execution, just need to move them out of the `toBeExecuted` folder
3. During UI automation tests execution, you can see the live preview at <http://localhost:4444/grid/admin/live>
4. Verify execution reports under **test-results** folder
5. Verify execution results/reports **test-results** folder
- We can view Allure report for historical test status and more summary report as well by generating from allure's log files under `test-results/allure/` folder  
`allure serve test-results/allure`  

*__NOTES__*  
1. The Dockerfile under __*docker/robot*__ folder is used to build python test runner. We don't have to build it manually, Docker Hub wil take care of it when there is a new commit to `master` branch, just need to pull it.  
2. If you're on Windows machine, you can run __*run-test-in-docker.bat*__ to execute the tests. However, please run following commands on the project root folder first to convert all `*.sh` files to use Unix EOL (LF) instead of Windows EOL (CRLF)  
```
git config core.autocrlf false
git rm --cached -r . 
git reset --hard
```
## Run test locally without Docker (To use during test script development)
### Prerequisites
- `python3` and `pip3` are required to run this framework 
- `nodejs` and `npm` are required to run `API testing` plus `Load Testing`
- `allure cli` to generate allure report from execution results


### Install plugin in Pycharm IDE
- Instructions:  
https://www.jetbrains.com/help/pycharm/managing-plugins.html  
- Plugins to install:
  - Robot Framework Support
  - IntelliBot @SeleniumLibrary Patched

### Setup Project Interpreter in Pycharm for your project
- Instructions: 
https://www.jetbrains.com/help/pycharm-edu/configuring-language-interpreter.html
- Select Python 3.7 or higher as your interpreter

### Install required libraries 
```
sudo pip3 install -r requirements.txt
npm i
``` 

*__NOTES__*  
- Depends on your OS and how many Python version (2 or 3) on your local, you may need to use `pip3` instead of `pip`
- If you are using Windows OS, no need to use `sudo` in above comments

### Setup browser drivers to run UI test  
Run following command in your terminal 
`sudo webdrivermanager firefox chrome --linkpath /usr/local/bin`

### Execution
1. Open terminal (make sure you are under project root folder, not on any sub folder)  
2. Use script under __ExecutionScripts/local-Execution__ folder to run  
    2.1 Run a test suite file and exclude tests with tag __No Run__   
`ExecutionScripts/local-Execution/bash/execution-NoRun.sh  <Relative path to test suite file>`  
    - **Examples:**  
`ExecutionScripts/local-Execution/bash/execution-NoRun.sh  Tests/AmazonTests.robot`  

   2.2. Run a test suite and just include a particular tag  
`ExecutionScripts/local-Execution/bash/execution-by-tag.sh  <Relative path to test suite file> <tag_name> `  
    - **Examples:**     
`ExecutionScripts/local-Execution/bash/execution-by-tag.sh  Tests/AmazonTests.robot  Smoke`    
  
    2.3. Run a test suite and just include a particular tag    
`ExecutionScripts/local-Execution/bash/execution-by-tag.sh  <Relative path to test suite file> <tag_name> `  
    - **Examples:**     
`ExecutionScripts/local-Execution/bash/execution-by-tag.sh  Tests/AmazonTests.robot  Smoke`

3. Run by `robot` command directly
    - **Examples:**   
`robot -d Result_execution/single-thread --logtitle "Single Thread Test Log" --reporttitle "Single Thread Test Report" --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot`

4. Parallel execution by replace `robot` with `pabot` in the execution command
    - **Examples:**  
`pabot --testlevelsplit -d Result_execution/parallel --logtitle "Parallel Test Log" --reporttitle "Parallel Test Report"  --listener 'allure_robotframework;test-results/allure' -v SELENIUM_HUB:   UI/Tests/SearchWeatherByCity.robot`  

## Run API Tests
1. Run all API tests in parallel   
`pabot -d api_results/  APIs/Tests`

2. Run Modal Driven test in parallel  
`pabot -d api_results/ -v APP_URL:"http://localhost:7777" APIs/Tests/FindByCityModalDriven.robot`

## Run Load Tests
1. Run Load Test  
`npm run loadtest`

2. Generate Load Test report  
`npm run loadtest_report`