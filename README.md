# Play Store Crawler

 See the `apps.csv` file as a sample result with 600+ app details

## Dependencies

 * [Ruby](https://www.ruby-lang.org/en/documentation/installation/). For mac, `brew install ruby`

 * [Ruby Gems](https://rubygems.org/pages/download). Would have been installed along with ruby


## Installation

A standard ruby and bundler installation:

```
git clone git@github.com:vedant1811/playstore-crawler.git
cd playstore-crawler

gem install bundler
bundle install
```


## Usage

Run the program by

```
ruby main.rb
```

This will append data apps to a file called `apps.csv`. A sample of the file is in this respository.

The program keeps running for a long time as it tries to crawl the entire playstore.

Stop the program by the `Interrupt` signal. Hit `ctrl + C` or `cmd + C`


## Notes

 * The `apps.csv` file is always appended. Be sure to (backup and) delete the file before running the app again.

 * The program tries to not have duplicate data fetched (or appended to the file). However, in some rare circumstances,
 duplicate rows may be present. This is done in the interest of speed and not to miss out on any data.
