class Memo < ActiveRecord::Base
  extend Enumerize

  validates :kind, presence: true
  validates :content, presence: true, length: { maximum: 100 }

  enumerize :kind, in: [:keep, :problem]
end
