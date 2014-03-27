class User < ActiveRecord::Base
  belongs_to :app
  has_many :blood_tests, dependent: :destroy
end
