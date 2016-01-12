class Tattoo
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :health_conditions, :reaction, :drugs, :permanent, :infection,
                :harmless, :verify, :age, :bday, :contact, :emergency

end
