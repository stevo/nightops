class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :mission_id
      t.integer :team_id

      t.timestamps null: false
    end
  end
end
