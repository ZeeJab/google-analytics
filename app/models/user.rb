# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  uid        :string(255)
#  provider   :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  def self.from_omniauth(auth)
    where(auth.slice("provider", "uid")).first || create_from_omniauth(auth)
  end

  def self.create_from_omniauth(auth)
    u = User.new
    u.name = auth[:info][:name]
    u.uid = auth[:uid]
    u.provider = auth[:provider]
    u.save
    u
    # create a new user, save provider, uid and name/nickname
  end
end
