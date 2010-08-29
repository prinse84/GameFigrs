Factory.define :user do |f|
  f.sequence(:username) {|n| "user#{n}" }
  f.sequence(:email) {|n| "ray#{n}@ray.com" }
  f.password 'secret'
  f.password_confirmation { |u| u.password}
end

Factory.define :team do |f|
  f.sequence(:name) { |n| "team name#{n}"}
  f.sequence(:shortname) { |n| "teamname#{n}"}
end

Factory.define :role do |f|
  f.name 'New Role'
end

Factory.define :membership do |f|
  f.association :user_id, :factory => :user
  f.association :team_id, :factory => :team
  f.association :role_id, :factory => :role
end

Factory.define :game do |f|
  f.association :team_id, :factory => :team
  f.game_date '2010-08-24'
  f.sequence(:opponent_name) {|n| "opponent#{n}"}
end