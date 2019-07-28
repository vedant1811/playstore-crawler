$LOAD_PATH.unshift File.join(File.dirname(__FILE__), ".") # current directory

require 'jobs/home_job'
require 'utils'

ROOT_URL = 'https://play.google.com/store/apps'
APP_URL_PREFIX = ROOT_URL + '/details?id='

def main
  home_job = HomeJob.new
  categories, apps = home_job.process
end

main
