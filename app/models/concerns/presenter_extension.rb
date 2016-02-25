module PresenterExtension
  extend ActiveSupport::Concern

  module ClassMethods
    def presenter
      GlucoseMeasurementPresenter
    end
  end
end

ActiveRecord::Base.send(:include, PresenterExtension)
