class HomePage
  include Capybara::DSL

  def url
    '/'
  end

  def visit_page
    visit url
    self
  end

  def title
    find("h1").text
  end

end