class CarbohydrateIntakePresenter < MetricPresenter
  def description_cell
    cell metric.description, 'carbohydrate-intake-description'
  end

  def form_fields
    super.merge({
      weight: {
        type: :number_field,
        input_attributes: {
          step: 0.1,
          min: 0,
          autofocus: 'autofocus'
        }
      },
      description: {
        type: :text_field
      }
    })
  end

  def cells
    super.push description_cell
  end

  def units
    {
      full: 'grams',
      short: 'g'
    }
  end
end
