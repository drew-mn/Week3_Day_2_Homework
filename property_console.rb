require ("pry")
require_relative("./models/property_finder")

Property.delete_all()

property1 = Property.new({
  'address' => "77 Renfrew Street",
  'value' => "£500k",
  'bedrooms' => 450,
  'year_built' => 1965
  })

  property1.save()

property2 = Property.new({
  'address' => "282 Hope Street",
  'value' => "£999k",
  'bedrooms' => 25,
  'year_built' => 1935
  })

  property2.save()

  property3 = Property.new({
  'address' => "121 Renfield Street",
  'value' => "£800k",
  'bedrooms' => 20,
  'year_built' => 1925
  })

  property3.save()

  property4 = Property.new({
  'address' => "60 Renfrew Street",
  'value' => "£900k",
  'bedrooms' => 300,
  'year_built' => 2010
  })

  property4.save()

  property1.address = "555 Road to Nowhere"
  property1.update()

  properties = Property.all()

  Property.find_by_id(78)

  Property.find_by_address("60 Renfrew Street")

  binding.pry
  nil
