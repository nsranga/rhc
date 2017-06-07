class CreateRetinas < ActiveRecord::Migration[5.0]
  def change
    create_table :retinas do |t|
      t.integer :hba1c

      t.timestamps
    end
  end
end
