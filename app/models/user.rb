class User < ActiveRecord::Base
  has_many :friendships
  has_many :transactions, :foreign_key => "user_id",:class_name => "Transaction", dependent: :destroy
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  has_secure_password
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 6 }
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end


  def transacting?(other_user, name)
    transactions.find_by(debtor_id: other_user.id,name: name)
  end

  def transact!(other_user, amount, name)
    transactions.create!(debtor_id: other_user.id, amount: 23.5, name: "New Transaction")
  end

  def settleup!(other_user, name)
    transactions.find_by(debtor_id: other_user.id, name: name).destroy
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  #def friendswith?(other_user)
    #relationships have not been set up yet
  #  relationships.find_by(friends_id: other_user.id)
  #end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end
end
