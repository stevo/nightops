# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = CreateAdminService.new.call
puts 'CREATED ADMIN USER: ' << user.email

3.times do |n|
  Team.create!(name:"Team#{n}").tap do |team|
    2.times do |i|
      u = User.create!(email:"user#{n}_#{i}@nightops.dev", password: "secret", password_confirmation: "secret")
      team.users << u
    end
    m = Mission.create!(name: "Mission#{n}", external_url: "google.com")
    Invitation.create!(mission_id: m.id, team_id: team.id)
  end
end

Team.all.each do |team|
  team.update_attribute(:owner_id, team.users.first.id)
end

