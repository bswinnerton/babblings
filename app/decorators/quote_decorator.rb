class QuoteDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    content_tag :div, content, class: 'notepad'
  end
end
