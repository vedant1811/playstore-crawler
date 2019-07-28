$LOAD_PATH.unshift File.join(File.dirname(__FILE__), ".") # current directory

require 'jobs/home_job'
require 'utils'

ROOT_URL = 'https://play.google.com/store/apps'

def main
  home_job = HomeJob.new
  home_job.process
end

main
