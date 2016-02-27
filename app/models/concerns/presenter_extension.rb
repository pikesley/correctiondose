module PresenterExtension
  extend ActiveSupport::Concern

  def presenter
    @presenter ||= "#{self.class.name}Presenter".constantize.new self
  end

  def <=> other
    self.datetime <=> other.datetime
  end

  module ClassMethods
    def model_presenter
      ModelPresenter.new self
    end
  end
end

ActiveRecord::Base.send(:include, PresenterExtension)
