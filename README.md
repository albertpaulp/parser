# Log Parser
[![<ORG_NAME>](https://circleci.com/gh/albertpaulp/parser.svg?style=svg)](https://app.circleci.com/pipelines/github/albertpaulp/parser)

Log Parser reads, analyses and pretty print statics from log files.

# Usage
Make sure `Ruby 3.1.1` is installed in your system.
```
git clone git@github.com:albertpaulp/parser.git
bundle install

./bin/parser.rb webserver.log
```

## Sample output
```
./bin/parser.rb webserver.log

List of webpages with most page views ordered from most pages views to less page views.
=======================================================================================
Total Views || Unique Views || URL
-----------------------------------------
90             22            /about/2
89             23            /contact
82             23            /index
81             21            /about
80             23            /help_page/1
78             23            /home
List of webpages with most unique page views also ordered
=========================================================
Total Views || Unique Views || URL
-----------------------------------------
80             23            /help_page/1
89             23            /contact
78             23            /home
82             23            /index
90             22            /about/2
81             21            /about
```

# Test

```
bundle install
bundle exec rspec
```

# Design considerations

- LogParser can be broken to 3 functional component(Parser, Analyser, Printer)
- Parser component abstracts logic to parse a specific type of log file, eg. webserver, application server etc.
- Analyser contains aggregation/analytical abstractions.
- Lastly, Presenter knows how to output data, eg. Json, StadOut etc.
- Designed in a way that we can add/swap different components to add/update functionality.
- For example, we should be able to use `JsonDownloader` as presenter instead of `StdOutput` with minimal change.
- Using CircleCI to automate running specs and linting with rubocop.
- Using simplecov to calculate test coverage(Currently at 98.6%). Coverage file is in `coverage/index`
