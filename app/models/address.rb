class Address < ApplicationRecord
    belongs_to :acct
    validates :street_number, :street_name, :city, :state, :zip, presence: true
    validates :acct_id, :uniqueness => {:scope => [:street_number, :street_name],
      message: "address not unique :o" }
  end
