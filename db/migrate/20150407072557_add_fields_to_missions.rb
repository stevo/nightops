class AddFieldsToMissions < ActiveRecord::Migration
  def change
    change_table :missions do |t|
      t.json :details
    end
  end
end
