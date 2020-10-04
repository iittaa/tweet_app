class Comment < ApplicationRecord
  validates :user_id, presence: true
  validates :content, presence: true, length: {in: 1..1000}
  # validates :post_id, presence: true
  # validates :reply, presence: true

  belongs_to :post, optional: true
  belongs_to :user


  belongs_to :reply, class_name: "Comment", optional: true
  has_many :reply_comments, class_name: "Comment", foreign_key: "reply_id", dependent: :destroy
 

end
