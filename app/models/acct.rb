class Acct < ApplicationRecord
    has_many :addresses
    validates_associated :addresses
    validates :username, :password, :email, presence: true
    validates :username, length: { minimum: 5 }
    
    validates :username, :password, uniqueness: true
    validates :email, uniqueness: { case_sensitive: false }


    PASSWORD_VALIDATOR = /(      # Start of group
    (?:                        # Start of nonmatching group, 4 possible solutions
      (?=.*[a-z])              # Must contain one lowercase character
      (?=.*[A-Z])              # Must contain one uppercase character
      (?=.*\W)                 # Must contain one non-word character or symbol
    |                          # or...
      (?=.*\d)                 # Must contain one digit from 0-9
      (?=.*[A-Z])              # Must contain one uppercase character
      (?=.*\W)                 # Must contain one non-word character or symbol
    |                          # or...
      (?=.*\d)                 # Must contain one digit from 0-9
      (?=.*[a-z])              # Must contain one lowercase character
      (?=.*\W)                 # Must contain one non-word character or symbol
    |                          # or...
      (?=.*\d)                 # Must contain one digit from 0-9
      (?=.*[a-z])              # Must contain one lowercase character
      (?=.*[A-Z])              # Must contain one uppercase character
    )                          # End of nonmatching group with possible solutions
    .*                         # Match anything with previous condition checking
  )/x   
  
  validates :password, {confirmation: true, presence: true, length: { minimum: 6}, format: {
    with: PASSWORD_VALIDATOR,
    message: "must contain 3 of the following 4: a lowercase letter, an uppercase letter, a digit, a non-word character or symbol"
    }}
end

