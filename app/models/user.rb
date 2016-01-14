class User < ActiveRecord::Base

  # subscriptions
  has_many :subscriptions, foreign_key: :follower_id,
           dependent: :destroy

  has_many :leaders, through: :subscriptions

  # followers
  has_many :reverse_subscriptions, foreign_key: :leader_id,
           class_name: 'Subscription', dependent: :destroy

  has_many :followers, through: :reverse_subscriptions

  # posts
  has_many :posts, dependent: :destroy
  has_many :text_posts, dependent: :destroy
  has_many :image_posts, dependent: :destroy

  def following?(leader)
    leaders.include? leader
  end

  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
    end
  end
end
