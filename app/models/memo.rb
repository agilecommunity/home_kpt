class Memo < ActiveRecord::Base
  extend Enumerize

  validates :kind, presence: true
  validates :content, presence: true, length: { maximum: 100 }

  enumerize :kind, in: [:keep, :problem]

  scope :current, -> {
    where('? <= created_at', duration.ago.beginning_of_day)
  }

  scope :keeps, -> { where(kind: :keep) }
  scope :problems, -> { where(kind: :problem) }

  scope :date_ordered, -> { order(created_at: :desc) }

  def self.duration
    2.weeks
  end
end
