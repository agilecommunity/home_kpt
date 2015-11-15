class Memo < ActiveRecord::Base
  validates :kind, presence: true
  validates :content, presence: true, length: { maximum: 100 }
end
