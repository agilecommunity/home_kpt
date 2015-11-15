class Memo < ActiveRecord::Base
  extend Enumerize

  validates :kind, presence: true
  validates :content, presence: true, length: { maximum: 100 }

  enumerize :kind, in: [:keep, :problem]

  scope :current, -> {
    where('? < created_at', 2.weeks.ago)
  }

  scope :keeps, -> { where(kind: :keep) }
  scope :problems, -> { where(kind: :problem) }

  scope :date_ordered, -> { order(created_at: :desc) }
end
