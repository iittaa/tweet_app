class Post < ApplicationRecord
  validates :content, presence: true, length: {maximum: 50}

  belongs_to :user
  has_many :comments, dependent: :destroy
  
  def user
    return User.find_by(id: self.user_id)
  end

end
