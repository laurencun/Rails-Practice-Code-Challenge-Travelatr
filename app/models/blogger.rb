class Blogger < ApplicationRecord

    has_many :posts
    has_many :destinations, through: :posts


    validates :name, presence: true, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def total_likes
        count = 0
        total_likes = 0
        self.posts do |p|
            while count < self.posts.length
            total_likes += p.likes
            end
        end
     total_likes
    end

    def most_liked_post
        self.posts.where(likes: Post.maximum(:likes))
    end

end