class QuoteDecorator < Draper::Decorator
  include Draper::LazyHelpers

  delegate_all

  def render(options = {})
    "<div class='notepad'>#{content}</div>".html_safe
  end
end
