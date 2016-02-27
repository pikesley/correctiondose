module PresenterExtension
  extend ActiveSupport::Concern

  def presenter
    "#{self.class.name}Presenter".constantize.new self
  end

  def <=> other
    self.datetime <=> other.datetime
  end

  module ClassMethods
#    def presenter
#      "#{@metric.class.name}Presenter".constantize.new
#    end
  end
end

ActiveRecord::Base.send(:include, PresenterExtension)
