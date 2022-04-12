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

# Test

```
bundle install
bundle exec rspec
```

# Design considerations

- LogParser can be broken to 3 functional component(Parser, Analyser, Printer)
- Parser component abstracts logic to parse a specific type of log.
- Analyser contains aggregation/analytical abstractions.
- Lastly, Printer knows how to output data.
- Designed in a way that we can add/swap different components to add/update functionality.
- For example, we should be able to use `JsonDownloader` as Printer instead of `StdOutput` with minimal change.
