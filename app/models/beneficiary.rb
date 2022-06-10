class Beneficiary < ApplicationRecord
  belongs_to :insured
  
  has_many :insureds, through: :insured_beneficiaries
end
