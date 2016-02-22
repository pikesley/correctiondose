require 'delegate'

class GenericPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper

  def label_cell
    cell model.class.short_name
  end

  def number_span attribute
    "<span class='number'>#{model.send attribute}</span>"
  end

  def units_span
    "<span class='units'>#{units[:short]}</span>"
  end

  def value_div attribute
    "<div class='value' data-toggle='tooltip' data-placement='top' title='#{model.send attribute} #{units[:full]}'>#{number_span} #{units_span}</div>"
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

  def to_tr content, padding: 0
    s = '<tr>'

    s += content.map { |c| "#{c}" }.join

    padding.times do
      s += filler_cell
    end

    s += '</tr>'

    s
  end

  def model
    __getobj__
  end
end
