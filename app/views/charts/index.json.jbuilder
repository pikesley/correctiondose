json.ignore_nil!

json.glucose @metrics.select {|m| m.class == GlucoseMeasurement }
json.carbs @metrics.select {|m| m.class == CarbohydrateIntake }
json.meds @metrics.select {|m| m.class == MedicationEvent }
