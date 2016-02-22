require 'delegate'

class GenericPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper

  def label_cell
    cell model.class.short_name
  end

  def units_span
    "<span class='units'>#{units[:short]}</span>"
  end

  def filler_cell
    cell '', 'filler'
  end

  def cell content, css_class = nil
    s = nil
    if css_class
      s = " class='#{css_class}'"
    end

    "<td#{s}>#{content}</td>"
  end

  def model
    __getobj__
  end
end
