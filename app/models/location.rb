class Location < ActiveRecord::Base
  validates :city, :state, :country, presence: true
  validates :state, presence: true,
                    length:   {in: 0..2}
  validates :state, :country, format: { with: /\A[a-zA-Z]+\z/, message: "only allows uppercase and lowercase letters" }
  validates :city, uniqueness: {scope: :state}

  def full_name
    "#{city}, #{state}, #{country}"
  end
end
