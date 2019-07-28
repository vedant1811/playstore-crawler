require 'httparty'
require 'nokogiri'
require 'cgi'

MAX_RETRIES = 3

# @return nokogiri HTML object
def fetch_page(url)
  retries ||= 0
  response = HTTParty.get(url)
  raise "unsuccessful response" unless response.success?

  Nokogiri::HTML(response.body)
rescue HTTParty::Error => e
  if (retries += 1) < MAX_RETRIES
    puts "[#{url}]ignoring error: #{e}"
    sleep(rand)
    retry
  else
    raise "[#{url}]max retries hit: #{e}"
  end
end

def links_on_page(html)
  html.css('a')
      .select { |e| e['href'] }
      .map do |a_tag|
        link = a_tag['href']
        # puts a_tag

        # doesn't break mailto links
        URI.join(ROOT_URL, link).to_s
      end
      .uniq
end

def app_links(links)
  links
      .select { |e| e.start_with?(APP_URL_PREFIX) }
      # .map do |url_string|
      #   uri = URI.parse url_string
      #   APP_URL_PREFIX + CGI.parse(uri.query)['id'].first
      # end
    # .uniq
end
