# Play Store Crawler


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

This will append data apps to a file called `apps.csv`


## Notes

 * The `apps.csv` file is always appended. Be sure to delete the file before running the app again.

 * The program tries to not have duplicate data fetched (or appended to the file). However, in some rare circumstances,
 duplicate rows may be present. This is done in the interest of speed and not to miss out on any data.
