class Ticket < ApplicationRecord
  belongs_to :user
  belongs_to :acceptor, class_name: 'User'
end
