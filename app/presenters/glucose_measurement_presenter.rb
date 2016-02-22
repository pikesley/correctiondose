require 'delegate'

class GlucoseMeasurementPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper

  def edit_cell
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.edit_glucose_measurement_path(model),
    title: 'Edit this measurement')
  end

  def label_cell
    cell model.class.short_name
  end

  def number_span
    "<span class='number'>#{model.value}</span>"
  end

  def units_span
    "<span class='units'>#{units[:short]}</span>"
  end

  def value_div
    "<div class='value' data-toggle='tooltip' data-placement='top' title='#{model.value} #{units[:full]}'>#{number_span} #{units_span}</div>"
  end

  def measurement_cell
    cell value_div, 'glucose-measurement-value'
  end

  def filler_cell
    cell '', 'filler'
  end

  def to_tr padding: 0
    s = "<tr>#{edit_cell}#{label_cell}#{measurement_cell}"

    padding.times do
      s += filler_cell
    end

    s += "</tr>"

    s
  end

  def cell content, css_class = nil
    s = nil
    if css_class
      s = " class='#{css_class}'"
    end

    "<td#{s}>#{content}</td>"
  end

  def units
    {
      full: 'millimoles per Litre',
      short: 'mmol/L'
    }
  end

  def model
    __getobj__
  end
end
