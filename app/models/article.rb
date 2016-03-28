class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
    where("text LIKE ?", "%#{search}%")
  end
end
