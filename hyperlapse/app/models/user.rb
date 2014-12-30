class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :firstname, presence: true, uniqueness: true
  validates :lastname, presence: true, uniqueness: true

  has_and_belongs_to_many :locations

  has_secure_password

  # associates a user with a specific location
  def add_location(location)
    self.locations.push(location) unless self.locations.include?(location)
  end

  def remove_location(location)
    self.locations.destroy(location) if self.locations.include?(location)
  end

end
