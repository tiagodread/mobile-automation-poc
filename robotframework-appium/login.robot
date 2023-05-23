*** Settings ***
Documentation  Simple example using AppiumFlutterLibrary

Library  AppiumFlutterLibrary  run_on_failure=No Operation
Library  DebugLibrary



*** Variables ***
${ANDROID_AUTOMATION_NAME}    flutter  #UIAutomator2
${ANDROID_APP}                ${CURDIR}/apps/app-sample.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=11}
${ANDROID_DEVICE_NAME}        Pixel 2 
*** Test Cases ***
Should log in successfully
  Open Test Application
  Input Email  example@example.com
  Input Password  Mudar@123
  Submit Login
  User should log in successfully


*** Keywords ***
Open Test Application
  Open Application  http://127.0.0.1:4723  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}   deviceName= ${ANDROID_DEVICE_NAME}  newCommandTimeout=300000
  
Input Email
  [Arguments]  ${email}
  Input Text  login-email  ${email}

Input Password
  [Arguments]  ${password}
  Input Text  login-password  ${password}

Submit Login
  Click Element  login-access

User should log in successfully
  Element Text Should Be  snack-bar-ok  Login success