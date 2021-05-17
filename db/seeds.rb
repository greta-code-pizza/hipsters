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
# Mettre à jour le fichier de seed pour avoir les catégories suivantes par défaut :
# Gestion de projet
# Data
# Design
# Dev
# Networking
# Sécurité




c = Category.create!(category: "Category")
project_management = Category.create!(category: "Category")
data = Category.create!(category: "Category")
Tag.create(category: c, tag: "test")
Tag.create(category: project_management, tag: "project")
Tag.create(category: data, tag: "données")
puts "created:"
puts "  * an admin with username/password of test/test"
puts "  * inactive-user for disowned comments by deleted users"
puts "  * a test tag"
puts
puts "If this is a dev environment, you probably want to run `rails fake_data`"
puts "If this is production, you want to run `rails console` to rename your admin, category, and tag"


# category.create([
#   {
#     :name => "project_management",
#     # :email => "project_management@example.com",
#     # :password => "project",
#     # :password_confirmation => "project"(END)
#     :description =>"Gestion des projets"
#   },
#   {
#     :name => "data",
#     # :email => "data@example.com",
#     # :password => "data",
#     # :password_confirmation => "data"
#     :description =>"Gestion des données"
#   },
#   {
#     :name => "design",
#     # :email => "design@example.com",
#     # :password => "design",
#     # :password_confirmation => "design"
#     :description =>"Interface graphique"
#   },
#   {
#     :name => "dev",
#     # :email => "dev@example.com",
#     # :password => "dev",
#     # :password_confirmation => "dev"
#     :description =>"Développement, rédaction de codes"
#   },
#   {
#     :name => "networking",
#     # :email => "networking@example.com",
#     # :password => "networking",
#     # :password_confirmation => "networking"
#     :description =>"Gestion des projets"
#   },
#   {
#     :name => "security",
#     # :email => "security@example.com",
#     # :password => "security",
#     # :password_confirmation => "security"
#     :description =>"Sécurité"
#   }

# ]
  


# Category.create(name: "Men's") do |category|
#   Subcategory.create(name: 'Slacks', category: category)
# end
# mens = Category.create(name: "Men's")