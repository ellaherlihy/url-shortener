class Link < ApplicationRecord
  validates :url, presence: true
  has_many :views, dependent: :destroy

  scope :recent_first, -> { order(created_at: :desc) }

  def to_param
    ShortCode.encode(id)
  end

  def self.find(id)
    super ShortCode.decode(id)
  end
end
