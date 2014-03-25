class App < ActiveRecord::Base
  has_many :users
  def self.register(name)
    app = App.new(name: name)
    app.key = (1..50).map { (("A".."Z").to_a + ("a".."z").to_a + (1..9).to_a).sample }.join
    app.secret = (1..10).map { (("A".."Z").to_a + ("a".."z").to_a + (1..9).to_a).sample }.join
    app.save
    app
  end
end
