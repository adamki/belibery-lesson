class Donation < ActiveRecord::Base
  belongs_to :fan

  validates :amount, numericality: {only_integer: true}
  validates :amount, numericality: {greater_than: 1,
                                    message: "Don't be Cheap!"}
  validates :status, inclusion: {in: %w(process pending cancelled), 
                                 message: "%{value} is not valid." }

end
