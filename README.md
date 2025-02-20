# Introduction 
Karate project, built with Karate (Standalone version) and Visual Studio Code.


# Getting started
1. Install the latest version of JRE or JDk. 
    * To check it, in the CMD, type "`java -version`" and you should the version of the JRE. 
    * Or go to the folder `C:\Program Files\Java` and you should see a jre folder
2. Install Visual Studio Code
3. Install the following plugins:
    * Cucumber (Gherkin) Full Support
    * Karate Runner 
    * Gherkin Beautifier
    * Bracket Pair Colorizer
    * Error Lens
    * Material Icon Theme
    * GitLens
    * copy-json-path
    * open in browser

## Karate Runner 
* Go to "**Extensions**"
* Click on the "**Manage**" icon for **Karate Runner**
* Click on "**Extension Setting**"
* Look for the setting "`Karate Runner › Karate Jar: Command Line Args`"
* Enter this value 
  ```
  RMDIR /S /Q target & java -DapiKey="eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJpc3RyYXRpLmlubmFAZ21haWwuY29tIiwianRpIjoiM2NiYjgyZTMtYjY2NS00ZjY2LWIxMjUtZDE2ZTAwMGMxYmI5IiwiaXNzIjoiQUVNRVQiLCJpYXQiOjE3Mzk1Njc4MzMsInVzZXJJZCI6IjNjYmI4MmUzLWI2NjUtNGY2Ni1iMTI1LWQxNmUwMDBjMWJiOSIsInJvbGUiOiIifQ.4MuAaxG_IvNh_qhKkYKZYMnYOCKsrJvpmQtcOXHUW7E" -cp karate.jar;. com.intuit.karate.Main -T 1 -t ~@ignore -f cucumber:json,junit:xml
  ```
  

## `test`
> The `api-tests` folder contains all your tests, which are written in feature files. 

## `.gitignore`
> A gitignore file specifies intentionally untracked files that Git should ignore. 

## `karate-config.js`
> `karate-config.js` contains all the global configurations and variables. 

## `karate.jar`
> Karate standalone jar file 

## `localConfig.json`
> `localConfig.json` is used to configure the settings when running the tests locally. 



### Run Karate Test From VS Code IDE
This is staight forward. Just click on the `Karate: Run` option above each scenario or feature to run it. 


#### Reports
Reports are generated in the `target` folder after each execution. 

`karate.log` file is also available in the `target` folder. It stores all the logs from Karate. It's very handy when it comes to debugging. 