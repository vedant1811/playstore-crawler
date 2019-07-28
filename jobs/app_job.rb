class AppJob
  def self.bulk_create(app_links, jobs, processed_app_urls)
    app_links
      .select { |e| !processed_app_urls.include?(e) }
      .map { |e| AppJob.new(e, jobs, processed_app_urls) }
      .each { |e| jobs << e }
  end

  def initialize(url, jobs, processed_app_urls)
    @url = url
    @jobs = jobs
    @processed_app_urls = processed_app_urls
  end

  def process
    return if @processed_app_urls.include?(@url)

    html = fetch_page(@url)
    links = links_on_page(html)
    AppJob.bulk_create(app_links(links), @jobs, @processed_app_urls)

    app_name = html.css('h1.AHFaub').first.content
    installs = installs(html)
    dev_email = dev_email(links)

    puts "AppJob process: #{@url}, #{@jobs.size}: #{app_name}, #{installs}, #{dev_email}"

    @processed_app_urls << @url
  end

private
  def dev_email(links)
    links.find { |e| e.start_with?('mailto') }
        .split(':')
        .last
  end

  def installs(html)
    html.css('.BgcNfc')
        .find { |e| e.content == 'Installs' }
        .next_sibling
        .content
  end
end
