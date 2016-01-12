class Piercing
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :contact_number, :address, :city, :state, :zipcode, :date_of_birth,
                :gender, :doc_name, :doc_address, :doc_city, :doc_phone, :contact_name,
                :contact_address, :contact_city, :allergies, :disorder, :body_part,
                :placement, :implications, :sign

end
