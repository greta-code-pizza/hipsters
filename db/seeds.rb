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
Tag.create(category: c1, tag: "project_management")

c2 = Category.create!(category: "Data")
Tag.create(category: c2, tag: "data")

c3 = Category.create!(category: "Design")
Tag.create(category: c3, tag: "design")

c4 = Category.create!(category: "Dev")
Tag.create(category: c4, tag: "development")

c5 = Category.create!(category: "Networking")
Tag.create(category: c5, tag: "networking")

c6 = Category.create!(category: "Security")
Tag.create(category: c6, tag: "security")

puts "created:"
puts "  * an admin with username/password of test/test"
puts "  * inactive-user for disowned comments by deleted users"
puts "  * a test tag"
puts
puts "If this is a dev environment, you probably want to run `rails fake_data`"
puts "If this is production, you want to run `rails console` to rename your admin, category, and tag"
