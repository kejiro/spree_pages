module Spree
  class PagesConfiguration < Preferences::Configuration
    PAGES_TAB ||= [:pages, :blogs, :blog_posts]
  end
end