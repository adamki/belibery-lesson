class Fan < ActiveRecord::Base
  belongs_to :location

  validates :name, presence: true,
    format: { with: /\A[a-zA-Z]+\z/, message: "Letters only!"}
  validates :email, uniqueness: true, presence: true

  scope :by_location, ->(location_id) {
    where(location_id: location_id)
  }

  default_scope { order(:name) }

  def self.joined_since(date)
    where("created_at > ?", date)
  end

  def nickname
    "#{name}lieber"
  end



end
