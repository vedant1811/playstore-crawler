require 'httparty'
require 'nokogiri'

MAX_RETRIES = 3

# @return nokogiri HTML object
def fetch_page(url)
  retries ||= 0
  response = HTTParty.get(url)
  raise "unsuccessful response" unless response.success?

  Nokogiri::HTML(response.body)
rescue HTTParty::Error, StandardError => e
  if (retries += 1) < MAX_RETRIES
    puts "[#{url}]ignoring error: #{e}"
    sleep(rand)
    retry
  else
    raise "[#{url}]max retries hit: #{e}"
  end
end
