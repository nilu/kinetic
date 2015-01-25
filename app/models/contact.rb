class Contact < ActiveRecord::Base
  belongs_to :user

  validates :email, :presence => true, :uniqueness => true
  validates :user_id, :presence => true
  validate :is_real_user

  private

  def is_real_user 
    if User.find_by_id(self.user_id).nil?
      errors.add(:user_id, "doesn't exist")
    end
  end
end
