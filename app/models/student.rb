class Student < ApplicationRecord
    #encrypted_id key: "jksfhretwleetutjdnc034jncf2"
    validates :first_name, :last_name, :year_of_birth, :gender, :address, :fathers_name, :mothers_name, :email, presence: true
    validates :email, uniqueness: true
    has_one_attached :image
end
