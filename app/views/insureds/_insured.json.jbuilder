json.extract! insured, :id, :cooperative_id, :cooperative_branch_id, :last_name, :first_name, :middle_name, :suffix, :birthdate, :gender, :age, :civil_status, :place_of_birth, :id_type, :id_no, :TIN_no, :nationality, :address, :premium, :created_at, :updated_at
json.url insured_url(insured, format: :json)
