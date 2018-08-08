class Visit < ApplicationRecord
  validates :user_id, presence: true,
  validates :short_url, presence: true

  def self.record_visit!(user, short_url)
    Visit.create!(
      user_id: user.id,
      short_url: short_url.id
    )
  end

  belongs_to :user 
    foreign_key: :user_id
    primary_key: :id
    class_name: "User"

end
