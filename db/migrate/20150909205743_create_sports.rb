class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|    
      t.string :name
      t.string :league

      t.timestamps
    end
  end
end
