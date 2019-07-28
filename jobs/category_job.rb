class CategoryJob
  def initialize(url, jobs)
    @url = url
    @jobs = jobs
  end

  def process
    puts "CategoryJob process: #{@url}, #{@jobs}"
    AppJob.bulk_create(app_links(links_on_page(@url)), @jobs)
  end
end
