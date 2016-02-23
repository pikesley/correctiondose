require 'delegate'

class GenericPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper

  def edit_cell path
    cell(link_to model.datetime.strftime('%H:%M'),
    url_helpers.send(path, model),
    title: "Edit #{model.class.short_name}")
  end

  def label_cell
    cell model.class.short_name
  end

  def number_span attribute
    "<span class='number'>#{model.send attribute}</span>"
  end

  def units_span
    "<span class='units'>#{units[:short]}</span>"
  end

  def value_div attribute, space: true
    s = ''
    s = ' ' if space

    "<div class='value' data-toggle='tooltip' data-placement='top' title='#{model.send attribute} #{units[:full]}'>#{number_span}#{s}#{units_span}</div>"
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

  def form_fields
    {
      datetime: {
        name: 'Date and time',
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

  def model
    __getobj__
  end
end
