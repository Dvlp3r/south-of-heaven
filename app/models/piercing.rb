class Piercing
  include ActiveModel::Model
  include ActiveModel::Conversion
  include ActiveModel::Validations

  attr_accessor :name, :contact_number, :address, :city, :state, :zipcode, :date_of_birth,
                :gender, :doc_name, :doc_address, :doc_city, :doc_phone, :contact_name,
                :contact_address, :contact_city, :allergies, :disorder, :body_part,
                :placement, :implications, :sign, :email, :phone

  validates :name, :doc_name, :doc_phone, :contact_name,
            :contact_number, :email, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, length: {maximum: 255 },
                    format: {with: VALID_EMAIL_REGEX}
end
