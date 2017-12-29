class Url < ApplicationRecord
  before_save :generate_short_url, :sanatize_data

  def to_param
    self.short_url.to_s
  end

  private
    def generate_short_url
      self.short_url = SecureRandom.urlsafe_base64(3)
    end

    def sanatize_data
      unless self.long_url.include?("http" || "https")
        self.long_url = "https://" + self.long_url
      end
    end
end
