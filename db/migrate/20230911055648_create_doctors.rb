class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.integer :mobile

      t.timestamps
    end
  end
end