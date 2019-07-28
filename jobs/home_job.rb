class HomeJob
  def process
    links = links_on_page(ROOT_URL)
    categories = links.select { |e| e.start_with?(ROOT_URL + '/category/') }
    apps = links.select { |e| e.start_with?(APP_URL_PREFIX) }
    [categories, apps]
  end
end
