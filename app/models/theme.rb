class Theme < ApplicationRecord
  validates :name, presence: true

  def self.find_all_theme
    Theme.all
  end

  def self.find_theme(user_id)
    user = find_users(user_id)
    Theme.find_by(id: user.theme_id).name
  end

  def self.find_current_id_theme(user_id)
    user = find_users(user_id)
    user.theme_id
  end

  def self.find_users(user_id)
    User.find_by(id: user_id)
  end

  def self.change_theme(theme_id, user_id)
    user = User.find(user_id)
    user.theme_id = theme_id
    user.save
  end

  def self.default
    Theme.find_or_create_by!(name: "monokai")
  end
end
