class CategoryJob
  def initialize(url, jobs, processed_app_urls)
    @url = url
    @jobs = jobs
    @processed_app_urls = processed_app_urls
  end

  def process
    AppJob.bulk_create(app_links(links_on_page(fetch_page(@url))), @jobs, @processed_app_urls)
    print 'c'
  end
end
