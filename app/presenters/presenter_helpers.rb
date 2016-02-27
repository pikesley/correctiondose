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

  def title_for_form symbol
    s = symbol.to_s
    return 'Date and time' if s == 'datetime'
    s[0].upcase + s[1..-1]
  end

  def model
    __getobj__
  end

  def metric
    __getobj__
  end
end
