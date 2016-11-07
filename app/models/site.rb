class Site < ActiveRecord::Base
  belongs_to :category

  validates :title, presence: {
    message: "Le titre doit être reseigné."
  }

  validates :title, uniqueness: {
    message: "Ce titre est déja pris."
  }
end
