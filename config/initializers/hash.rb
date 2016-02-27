class Hash
  def widest
    widest = 0
    self.each_pair do |k, v|
      v.each do |a|
        widest = a.presenter.width if a.presenter.width > widest
      end
    end
    widest
  end

  def first_metric
    self.dig(:first, :second, :first) || nil
  end
end
