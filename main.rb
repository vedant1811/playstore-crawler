$LOAD_PATH.unshift File.join(File.dirname(__FILE__), ".") # current directory

require 'jobs/home_job'
require 'jobs/category_job'
require 'jobs/app_job'
require 'utils'
require 'concurrent'

ROOT_URL = 'https://play.google.com/store/apps'
APP_URL_PREFIX = ROOT_URL + '/details?id='

def process(jobs)
  5.times.map do |e|
    puts "Thread #{e}"
    Thread.new(jobs) do |jobs_arg|
      while !jobs_arg.empty?
        jobs_arg.pop(true).process
      end
    end
  end
    .map(&:join)
  puts
end

def main
  home_job = HomeJob.new
  categories, apps = home_job.process

  jobs = Queue.new
  processed_app_urls = Concurrent::Set.new

  categories.map { |e| CategoryJob.new(e, jobs, processed_app_urls) }
    .each { |e| jobs << e }

  AppJob.bulk_create(apps, jobs, processed_app_urls)

  process(jobs)
end

main
