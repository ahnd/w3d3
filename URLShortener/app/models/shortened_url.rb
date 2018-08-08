class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true

    belongs_to :user,
      foreign_key: :user_id,
      primary_key: :id,
      class_name: "User"

    def self.random_code
      code = SecureRandom.urlsafe_base64
      until !ShortenedUrl.exists?(short_url: code)
         code = SecureRandom.urlsafe_base64
      end
      code
    end

    def self.create_url!(user, long_url)
      ShortenedUrl.create!(
        user_id: user.id,
        long_url: long_url,
        short_url: ShortenedUrl.random_code
      )
    end

    has_many :visitors,
      foreign_key: :short_url_id
      primary_key: :id
      class_name: "Visit"

      
end
