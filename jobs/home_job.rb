class HomeJob
  def process
    links = links_on_page(fetch_page(ROOT_URL))
    categories = links.select { |e| e.start_with?(ROOT_URL + '/category/') }
    apps = app_links(links)
    [categories, apps]
  end
end
