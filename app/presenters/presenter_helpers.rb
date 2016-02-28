module PresenterHelpers
  def url_friendly
    underscore.gsub('_', '-').gsub(' ', '-').downcase
  end

  def button_name
    "btn-#{url_friendly}"
  end

  def model
    __getobj__
  end

  def metric
    __getobj__
  end
end
