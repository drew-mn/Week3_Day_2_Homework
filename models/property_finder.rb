require("pg")

class Property

attr_accessor :address, :value, :bedrooms, :year_built
attr_reader :id

  def initialize(properties)
    @id = properties["id"].to_i if properties["id"]
    @address = properties["address"]
    @value = properties["value"]
    @bedrooms = properties["bedrooms"].to_i
    @year_built = properties["year_built"]
  end

  def save()
    db = PG.connect({ dbname: "properties", host: "localhost" })
    sql = "INSERT INTO properties
      (address, value, bedrooms, year_built)
      VALUES
      ($1, $2, $3, $4)
      RETURNING *"

      values = [@address, @value, @bedrooms, @year_built]

      db.prepare("save", sql)
      @id = db.exec_prepared("save", values)[0]["id"].to_i
      db.close()
  end

  def update()
  db = PG.connect({ dbname: "properties", host: "localhost" })

  sql = "UPDATE properties SET
  (address, value, bedrooms, year_built)
  = ($1, $2, $3, $4)
  WHERE id = $5"

  values = [@address, @value, @bedrooms, @year_built, @id]

  db.prepare("update", sql)
  orders = db.exec_prepared("update", values)
  db.close()
end

  def Property.all()
  db = PG.connect({ dbname: "properties", host: "localhost" })

  sql = "SELECT * FROM properties"

  db.prepare("all", sql)
  orders = db.exec_prepared("all")
  db.close()
  return orders.map {|order_hash| Property.new(order_hash)}
end

def Property.delete_all()
  db = PG.connect({ dbname: "properties", host: "localhost" })

    sql = "DELETE FROM properties"

    db.prepare("delete_all", sql)
    db.exec_prepared("delete_all")
    db.close()
end

# def Property.find_by_id(id)
#     db = PG.connect({ dbname: "properties", host: "localhost" })
#     # sql code here
#     sql = "SELECT FROM properties WHERE id = $1"
#     values = [id]
#     db.prepare("find_by_id", sql)
#     db.exec_prepared("find_by_id", values)
#     db.close()
#
#     found_properties_hash = properties[0]
#     return Property.new(found_properties_hash)
# end

def Property.find_by_id(id)
    db = PG.connect({ dbname: "properties", host: "localhost" })
    # sql code here
    sql = "SELECT * FROM properties WHERE id = $1"
    values = [id]
    db.prepare("find_by_id", sql)
    found_properties = db.exec_prepared("find_by_id", values)
    db.close()
    return found_properties.map{|found_properties_hash|
    Property.new(found_properties_hash)}
end

def Property.find_by_address(address)
    db = PG.connect({ dbname: "properties", host: "localhost" })

    sql = "SELECT * FROM properties WHERE address = $1"
    values = [address]
    db.prepare("find_by_address", sql)
    found_properties = db.exec_prepared("find_by_address", values)
    db.close()
    return found_properties.map{|found_properties_hash|
    Property.new(found_properties_hash)}
end

end
