class CreateInsureds < ActiveRecord::Migration[7.0]
  def change
    create_table :insureds do |t|
      t.references :cooperative#, null: false, foreign_key: true
      t.references :cooperative_branch#, null: false, foreign_key: true
      t.string :last_name
      t.string :first_name
      t.string :middle_name
      t.string :suffix
      t.date :birthdate
      t.string :gender
      t.integer :age
      t.string :civil_status
      t.string :place_of_birth
      t.string :id_type
      t.string :id_no
      t.string :nationality
      t.string :address
      t.string :height
      t.string :weight
      t.string :contact_no
      t.string :source_of_income
      t.string :business_address
      t.string :tel_no
      t.string :member_since
      t.decimal :premium, precision: 5, scale: 2

      t.timestamps
    end
  end
end
