class Conversation < ApplicationRecord
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"

  has_many :messages

  validates_uniqueness_of :sender_id, scope: :recipient_id

  # only the conversation of the current user
  # scope is like a function (i.e. def)
  scope :involving, -> (user) do
    where("conversations.sender_id = ? OR
    conversations.recipient_id = ?", user.id, user.id)
  end

  # check if conversation exists between 2 given users
  scope :between, -> (sender_id, recipient_id) do
    where("(conversations.sender_id = ? AND
    conversations.recipient_id = ?) OR (conversations.sender_id = ? AND
    conversations.recipient_id = ?)", sender_id, recipient_id, recipient_id, sender_id)
  end

end
