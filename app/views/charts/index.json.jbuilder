
json.ignore_nil!

json.glucose @raw_metrics.select {|m| m.class == GlucoseMeasurement }
json.carbs @raw_metrics.select {|m| m.class == CarbohydrateIntake }
json.meds @raw_metrics.select {|m| m.class == MedicationEvent }
