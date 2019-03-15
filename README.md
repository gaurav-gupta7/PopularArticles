# NYTimesArticles


An app to hit the NY Times Most Popular Articles API and:
* Show a list of articles
* Shows details when items on the list are tapped.

The most viewed section of this API is used in the app.
http://api.nytimes.com/svc/mostpopular/v2/mostviewed/{*section*}/{*period*}.json?apikey= sample-key To test this API, 
For testAPI we used:
* section - "all-sections"
* period - 7

MVVM Design pattern and swift generic approach to develop this application is used.
For CI/CD Fastlane is used.


## Tools And Resources Used

- [CocoaPods](https://cocoapods.org/)
- [fastlane](https://docs.fastlane.tools/)
- [SwiftLint](https://github.com/realm/SwiftLint)
- [Scan](https://docs.fastlane.tools/actions/scan/)
- [Slather](https://github.com/SlatherOrg/slather)


## Library Used
- [SDWebImage](https://github.com/rs/SDWebImage)
- [SwiftLint ](https://github.com/realm/SwiftLint)

## TODO
* Sorting option for user to sort article based popularity, Date, Alphabetically 
* Refresh articles using pull to refresh or refresh button.
* Configure fastlane lanes/XcodeServerBot for build creation and provising and certificate managment.
* Configure Fastlane  lanes for build upload on iTunesConnect.


# Installation

* Installation by cloning the repository
* Go to directory
* use command + B or Product -> Build to build the project
* Incase of build fail due to dependency SDWebImageView, install SDWebImageView using CocoaPods.
* Incase of build fail due to dependency ReachabilitySwift, install ReachabilitySwift using CocoaPods.
* Press run icon in Xcode or command + R to run the project on Simulator


### Fastlane

Fastlane has been used to perform following tasks with a help of a script written in *Fastfile*.
*Gemfile* is used to define your dependency on fastlane.

Tasks:-
* Downloading dependency of projects mentioned in *Podfile*
* Build the project
* Linting
* Run unit tests and code coverage

Execution:-
* Open terminal and navigate to project directory.
* Run `bundle exec fastlane integrate`

Results:-
* Build - Archive is created in ~/NYTimesArticles/build-dir.
* Tests - Test report is generated at `~/NYTimesArticles/fastlane/test_output/report.html`
* Lint - Lint report is generated at `~/NYTimesArticles/fastlane/swiftlint.result.json`
* Code Coverage - Code coverage is generated at `~/NYTimesArticles/fastlane/test_output/code_coverage/index.html`

![](https://github.com/gaurav-gupta7/Images/blob/master/Screenshot%202019-03-15%20at%2011.08.00%20AM.png)


##  SonarQube Integration

This is also another tool integrated for check project code health reports.

* Project already contains  `run-sonar-swift.sh` and `sonar-project.properties` in project root folder.
* Once your server up, goto project directory.
* Run the command from project directory using terminal `$ sh run-sonar-swift.sh`
* On successful results, open browser and hit `http://localhost:9000/`, 
* You will see the project analyses, Tap on project analyses it will show detail reports 

![](https://raw.githubusercontent.com/gaurav-gupta7/Images/master/Screenshot%202019-03-15%20at%207.20.26%20AM.png)

# Architecture

### View Controllers
* **ArticleListViewController** - It displays most popular  articles in a table view.  
* **ArticleDetailViewController** - Displays article details in a scroll view.

### View Models
* **ArticleListViewModel** - Initialised with an instance conforming to *ArticleFetcherProtocol* protocol. It is responsible for fetching articles and updating *ArticleListViewController*
* **ArticleTableViewCellViewModel** - Initialised with *Article*, responsible for displaying data in *ArticleTableViewCell*
* **ArticleDetailViewModel** - Initialised with *Article*, responsible for displaying data in *ArticleDetailViewController*
