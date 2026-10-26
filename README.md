Web tests in Robot framework.

***Pre-requisities***
- Node.js and npm installed
- python 3 and pip installed
- user account with primary MFA setup to authenticator app


***Setup***
1. Install Robot framework (https://docs.robotframework.org/docs/getting_started/ide):
    python3 --version
    python3 -m pip install --upgrade pip
    python3 -m pip install robotframework

2. Install and initialize Browser library
    python3 -m pip install robotframework-browser
    rfbrowser init

3. Install pyotp library
    pip install pyotp

4. Install dotenv library
    pip install dotenv

5. Update test user and password in Config.resource file, save OTP secret in .env file in the root of the directory


***Run the test***
1. Open terminal.
2. Go to the web_test_rf directory
3. Run the command: 'robot --test "Add Product To Cart" Test_UI.robot'
4. After the test run completes, you can view the results in the results directory:
    - output.xml: The detailed output of the test run.
    - report.html: A summary report of the test execution.
    - log.html: A detailed log of the test execution.
