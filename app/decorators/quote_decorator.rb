class QuoteDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    content.html_safe
  end
end
