require 'delegate'
require_relative 'presenter_helpers'

class ModelPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper
  include PresenterHelpers

  def as_add_button css_class = nil
    css_classes = ['btn', "#{button_name}"]
    css_classes.push css_class if css_class
    path = "new_#{underscore}_path"
    link_to "Add #{model.short_name}",
      url_helpers.send(path),
      class: css_classes.join(' ')
  end

  def underscore
    model.name.underscore
  end

  def method_missing m
    model.send(m.id2name)
  end

  def model
    __getobj__
  end
end
