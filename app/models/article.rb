class Article < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  validates :title, presence: true,
            length: { minimum: 5 }
  validates :text, presence: true

  def self.search(search)
    #where("title LIKE ?", "%#{search}%")
   # where("text LIKE ?", "%#{search}%")
    where("title LIKE ? OR text LIKE ?", "%#{search}%", "%#{search}%")
  end
end
