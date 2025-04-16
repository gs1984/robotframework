**Step 1**
Download python version 3.10 from: https://www.python.org/downloads/release/python-3100/

**Step 2**
download node.js from: https://nodejs.org/en/download

**Step 3**
Install requirements.txt using command:
pip install -r requirements.txt

**Step 4**
Install Robot Framework browser using command
pip install robotframework-browser

**Step 5**
Initialize Browser Library command:
rfbrowser init

**Step 6**
Install Playwright dependencies using command
npx playwright install-deps

**Step 7**
Change the Headless - True to False, into the app-config.yaml file for local run.

**Step 8**
Run the Test Cases using Command:
python -m robot .\tests\filename.robot
	or	
Run the Test Cases using Tag, Command:
python -m robot -i "tagname" .

**Execution of tests using tags**
AND Command:
python -m robot -i "tagname" -i "tagname" .
If the user intends to execute test cases with two specific tags, such as "regression" and the module name "ar_manager", only those test cases matching both tags will be executed using the provided command.

Tag | Suite
cmp_ar_manager | Runs all the tests for AR Manager
cmp_call_handling | Runs all the tests for Call Handling
tsn_regression | Runs all the regression tests
plt_GEN2_WEB | Runs all the Web tests
negative | Runs all the negative tests
