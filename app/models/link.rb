class Link < ApplicationRecord
  validates :url, presence: true
  has_many :views, dependent: :destroy
  belongs_to :user, optional: true

  scope :recent_first, -> { order(created_at: :desc) }

  def to_param
    ShortCode.encode(id)
  end

  def self.find(id)
    super ShortCode.decode(id)
  end

  after_save_commit if: :url_previously_changed? do
    MetadataJob.perform_later(to_param)
  end

  def domain
    URI(url).host rescue StandardError URI::InvalidURIError
  end

  def editable_by?(user)
    user_id? && (user_id == user&.id)
  end

end
