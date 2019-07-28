class AppJob
  def self.bulk_create(app_links, jobs)
    app_links.map { |e| AppJob.new(e, jobs) }
      .each { |e| jobs << e }
  end

  def initialize(url, jobs)
    @url = url
    @jobs = jobs
  end

  def process
    puts "AppJob process: #{@url}, #{@jobs}"
  end
end
