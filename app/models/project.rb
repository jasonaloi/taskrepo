class Project < ApplicationRecord
  has_many :tasks, dependent: :delete_all
end
