class AppJob
  def self.bulk_create(app_links, jobs, processed_app_urls)
    app_links.map { |e| AppJob.new(e, jobs, processed_app_urls) }
      .each { |e| jobs << e }
  end

  def initialize(url, jobs, processed_app_urls)
    @url = url
    @jobs = jobs
    @processed_app_urls = processed_app_urls
  end

  def process
    return if @processed_app_urls.include?(@url)

    puts "AppJob process: #{@url}, #{@jobs.size}"
    @processed_app_urls << @url
  end
end
