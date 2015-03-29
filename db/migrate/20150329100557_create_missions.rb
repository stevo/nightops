class CreateMissions < ActiveRecord::Migration
  def change
    create_table :missions do |t|
      t.string :name
      t.string :external_url
      t.datetime :start_at

      t.timestamps
    end
  end
end
