require 'delegate'
require_relative 'presenter_helpers'

class MetricPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper
  include PresenterHelpers

  def thing
    form_fields.keys[1]
  end

  def edit_cell
    path = "edit_#{underscore}_path"
    cell(link_to metric.datetime.strftime('%H:%M'),
    url_helpers.send(path, metric),
    title: "Edit #{metric.class.short_name}")
  end

  def label_cell
    cell metric.class.short_name
  end

  def number_span
    "<span class='number'>#{MetricPresenter.rounder(metric.send thing)}</span>"
  end

  def units_span
    "<span class='units'>#{units[:short]}</span>"
  end

  def measurement_cell extra_css_class = nil
    params = ["#{url_friendly}-#{thing.to_s}"]
    if extra_css_class
      params.push extra_css_class
    end
    cell value_div, params
  end

  def value_div space: true
    s = ''
    s = ' ' if space

    "<div class='value' data-toggle='tooltip' data-placement='top' title='#{metric.send thing} #{units[:full]}'>#{number_span}#{s}#{units_span}</div>"
  end

  def filler_cell
    cell '', 'filler'
  end

  def cell content, css_classes = nil
    s = nil
    if css_classes
      css_classes = [css_classes] unless css_classes.is_a? Array
      s = " class='"
      s += css_classes.join(' ').strip
      s += "'"
    end

    "<td#{s}>#{content}</td>"
  end

  def cells
    [
      edit_cell,
      label_cell,
      measurement_cell
    ]
  end

  def fields
    form_fields.keys
  end

  def form_fields
    {
      datetime: {
        type: :text_field,
        css_class: 'datetime'
      }
    }
  end

  def to_tr padding: 0
    s = '<tr>'

    s += cells.map { |c| "#{c}" }.join

    if padding
      padding.times do
        s += filler_cell
      end
    end

    s += '</tr>'

    s
  end

  def width
    cells.count
  end

  def underscore
    metric.class.name.underscore
  end

  def self.title_for_form symbol
    s = symbol.to_s
    return 'Date and time' if s == 'datetime'
    s[0].upcase + s[1..-1]
  end

  def self.rounder number
    return number if number.is_a? String
    return number if number.is_a? Integer
    parts = number.to_s.split('.')
    return number if parts[1].to_i > 0
    parts[0].to_i
  end

  def method_missing m
    model.class.send(m.id2name)
  end

  def metric
    __getobj__
  end
end
