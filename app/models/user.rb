class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  belongs_to :table
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]
  validates :nickname, presence: true, uniqueness: true
  validates :exptolvl, numericality: {only_integer: true}
  validates :lvl, numericality: {only_integer: true}
  validates :exp, numericality: {only_integer: true}
  validates :status, presence: true

 # def self.from_omniauth(auth)
    #  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     #   user.provider = auth.provider
    #   user.uid = auth.uid
     #   user.email = auth.info.email
     #   user.password = Devise.friendly_token[0,20]
   #   end
 # end
  def self.from_omniauth(auth)
  if user = User.find_by_email(auth.info.email)  # search your db for a user with email coming from fb
    return user  #returns the user so you can sign him/her in
  else
    user = User.create(provider: auth.provider,    # Create a new user if a user with same email not present
                       uid: auth.uid,
                       email: auth.info.email,
                       password: Devise.friendly_token[0,20],
      nickname: auth.info.name, status: 'offline',exp:0, lvl:1, exptolvl:20)
    flash[:notice] = "User successfully created"
    return user

  end
end
  def online?
    scope :online, lambda{ where("updated_at > ?", 10.minutes.ago) }
  end
end
