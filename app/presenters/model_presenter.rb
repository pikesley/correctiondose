require 'delegate'

class ModelPresenter < SimpleDelegator
  # http://stackoverflow.com/questions/6074831/how-to-access-url-helper-from-rails-module
  delegate :url_helpers, to: 'Rails.application.routes'

  # https://christoph.luppri.ch/articles/2015/07/04/handmade-rails-presenters/
  include ActionView::Helpers::UrlHelper

  def as_add_button
    '<a class="btn btn-glucose" href="/glucose/new">Add Glucose</a>'
  end

  def model
    __getobj__
  end
end
