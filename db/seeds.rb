pwd = SecureRandom.base58
User.create(
  :username => "inactive-user",
  :email => "inactive-user@example.com",
  :password => pwd,
  :password_confirmation => pwd
)

User.create(
  :username => "test",
  :email => "test@example.com",
  :password => "test",
  :password_confirmation => "test",
  :is_admin => true,
  :is_moderator => true,
  :karma => [
    User::MIN_KARMA_TO_SUGGEST,
    User::MIN_KARMA_TO_FLAG,
    User::MIN_KARMA_TO_SUBMIT_STORIES,
    User::MIN_KARMA_FOR_INVITATION_REQUESTS
  ].max,
  :created_at => User::NEW_USER_DAYS.days.ago
)

c1 = Category.create!(category: "Project_management")
Tag.create(category: c1, tag: "CDA")

c2 = Category.create!(category: "Data")
Tag.create(category: c2, tag: "CDA-BTS")

c3 = Category.create!(category: "Design")
<<<<<<< HEAD
Tag.create(category: c3, tag: "Web-designer")
=======
Tag.create(category: c3, tag: "design")
>>>>>>> 41954403f7d7035150b8881c0ab2a5a8e415c33a

c4 = Category.create!(category: "Dev")
Tag.create(category: c4, tag: "CDA-BTS-Kercode")

c5 = Category.create!(category: "Networking")
Tag.create(category: c5, tag: "CDA-BTS")

c6 = Category.create!(category: "Security")
Tag.create(category: c6, tag: "CDA-BTS")

puts "created:"
puts "  * an admin with username/password of test/test"
puts "  * inactive-user for disowned comments by deleted users"
puts "  * a test tag"
puts
puts "If this is a dev environment, you probably want to run `rails fake_data`"
puts "If this is production, you want to run `rails console` to rename your admin, category, and tag"
