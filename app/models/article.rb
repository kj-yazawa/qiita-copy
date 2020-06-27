class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true

  def written_by?(user)
    self.user.id == user.id
  end
end
