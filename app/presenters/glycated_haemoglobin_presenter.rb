class GlycatedHaemoglobinPresenter < GenericPresenter
#  def thing
#    :percentage
#  end

  def value_div
    super space: false
  end

  def form_fields
    super.merge({
      percentage: {
        type: :number_field,
        input_attributes: {
          step: 0.1,
          min: 0,
          autofocus: 'autofocus'
        }
      }
    })
  end

  def units
    {
      full: 'percent',
      short: '%'
    }
  end
end
