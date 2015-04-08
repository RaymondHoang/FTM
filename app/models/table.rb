class Table < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users
  validates :user_id, uniqueness: true, allow_nil: true
  validates :user_id2, uniqueness: true, allow_nil: true
  validates :user_id3, uniqueness: true, allow_nil: true
  validates :user_id4, uniqueness: true, allow_nil: true
  validates :user_id5, uniqueness: true, allow_nil: true
  validates :user_id6, uniqueness: true, allow_nil: true
  validates :user_id7, uniqueness: true, allow_nil: true
end
