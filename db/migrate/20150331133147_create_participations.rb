class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations  do |t|
      t.integer :mission_id
      t.integer :user_id
      t.integer :status
    end
  end
end
