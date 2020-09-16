#!/bin/sh

reportDir="/tests/out/API"

pabot -d api_results/ -d ${reportDir}  --listener allure_robotframework  --log API_Paralle_Testing_log.html --report API_Paralle_Testing_report.html --output API_Paralle_Testing.xml APIs/Tests

pabot -d api_results/ -d ${reportDir}  --listener allure_robotframework  --log API_ModalDriven_Testing_log.html --report API_ModalDriven_Testing_report.html --output API_ModalDriven_Testing.xml  -v APP_URL:"http://localhost:7777" APIs/Tests/FindByCityModalDriven.robot