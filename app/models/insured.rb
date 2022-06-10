class Insured < ApplicationRecord
  belongs_to :cooperative
  belongs_to :cooperative_branch
  has_one :occupation 

  has_many :beneficiaries
  accepts_nested_attributes_for :beneficiaries, reject_if: :all_blank, allow_destroy: true, limit: 4

  has_many :dependents
  accepts_nested_attributes_for :dependents, reject_if: :all_blank, allow_destroy: true, limit: 4

  # accepts_nested_attributes_for :occupation

  before_save :compute_age
  before_save :add_premium

  def compute_age
    self.age = Date.today.year - self.birthdate.year 
  end

  def add_premium
    self.premium = 500
  end

  def full_name 
    "#{first_name ? first_name : "" } #{middle_name ? middle_name[0] : ""}. #{last_name ? last_name : "" } #{suffix ? suffix : "" }"
  end
  
  def id_type_no  
    "#{id_type ? id_type : "NONE"} - #{id_no ? id_no : "NONE"}"
  end

  def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file)

		(2..spreadsheet.last_row).each do |row|
			coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(row,'A').strip)
      coop.address = "-"
			branch = CooperativeBranch.find_or_initialize_by(cooperative_id: coop.id, name: spreadsheet.cell(row,'B').to_s.strip)
      branch.address = "-"

      insured = Insured.find_or_initialize_by(cooperative_id: coop.id, cooperative_branch_id: branch.id, 
      last_name: spreadsheet.cell(row, 'C').strip, 
      first_name: spreadsheet.cell(row, 'D').strip, 
      middle_name: spreadsheet.cell(row, 'E').strip, 
      suffix: spreadsheet.cell(row, 'F'), 
      birthdate: spreadsheet.cell(row, 'G')) 
      insured.gender = spreadsheet.cell(row, 'H').strip 
      insured.civil_status = spreadsheet.cell(row, 'I').strip 
      insured.place_of_birth = spreadsheet.cell(row, 'J').strip 
      insured.address = spreadsheet.cell(row, 'K').strip 
      insured.id_type = spreadsheet.cell(row, 'L').strip 
      insured.id_no = spreadsheet.cell(row, 'M').to_s.strip 
      insured.TIN_no = spreadsheet.cell(row, 'N').to_s.strip 
      insured.nationality = spreadsheet.cell(row, 'O').strip 
      insured.premium = spreadsheet.cell(row, 'P')

			puts "* #{coop.name} - #{insured.last_name} #{insured.first_name}" if insured.save!
		end
	end
end
