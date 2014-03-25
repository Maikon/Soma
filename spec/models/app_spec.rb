require 'spec_helper'

describe App do
  it 'generates a key and secret on initialisation' do
    somatra = App.register("Somatra")
    App.any_instance.stub(:save)
    expect(somatra.key).not_to be(nil)
    expect(somatra.secret).not_to be(nil)
  end
end
