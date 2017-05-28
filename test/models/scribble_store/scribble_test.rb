require 'test_helper'

module ScribbleStore
  class ScribbleTest < ActiveSupport::TestCase
    # test "the truth" do
    #   assert true
    # end

    test 'should be valid without a source scribble' do
      scribble = Scribble.new(artist_email: 'random@fake.com', image: 'picture.png')
      assert(scribble.valid? == true, scribble.errors.full_messages.join(', '))
    end
  end
end
