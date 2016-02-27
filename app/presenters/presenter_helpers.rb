module PresenterHelpers
  def url_friendly
    underscore.gsub('_', '-').gsub(' ', '-').downcase
  end

  def button_name
    "btn-#{short_name.gsub('_', '-').gsub(' ', '-').downcase}"
  end

  def url_friendly
    underscore.gsub('_', '-').gsub(' ', '-').downcase
  end

  def model
    __getobj__
  end

  def metric
    __getobj__
  end
end
