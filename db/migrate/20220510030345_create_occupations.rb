class CreateOccupations < ActiveRecord::Migration[7.0]
  def change
    create_table :occupations do |t|
      t.references :insured#, null: false, foreign_key: true
      t.string :name
      t.string :employer_name
      t.string :employer_address
      t.string :business_type

      t.timestamps
    end
  end
end
