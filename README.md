# Log Parser
This program receives a log file and calculates the number
of visits each path has received and display then in order of
number of visits (descending order).

## Install

This program is written in Ruby. In order to execute this program you will need to install the following gems (libraries in Ruby).
- Bundler
- Active Support
- Rspec

You can do it this way

```bash
gem install bundler
bundle install
```

## Running

### The tests

You can execute the tests by typing the following line.

```bash
bundle exec rspec spec --format documentation
```

### The program

You can run program by calling the script directly as follow.

```bash
./main.rb webserver.log
```