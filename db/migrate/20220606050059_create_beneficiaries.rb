class CreateBeneficiaries < ActiveRecord::Migration[7.0]
  def change
    create_table :beneficiaries do |t|
      t.references :insured, null: false, foreign_key: true
      t.string :name
      t.date :date_of_birth
      t.string :relationship

      t.timestamps
    end
  end
end
