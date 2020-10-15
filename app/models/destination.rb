class Destination < ApplicationRecord

    has_many :posts
    has_many :bloggers, through: :posts


    def most_recent_posts
        self.posts.order('created_at DESC').limit(5)
    end

    def most_liked_post
        self.posts.where(likes: Post.maximum(:likes))
    end

    def average_blogger_age
        ages = self.posts.map {|p| p.blogger.age}
        unique_ages = ages.uniq
        unique_ages.sum / self.posts.count
    end

end
