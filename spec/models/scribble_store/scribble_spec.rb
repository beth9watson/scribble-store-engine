require 'spec_helper'

describe ScribbleStore::Scribble do

  it 'has a valid factory' do
    expect(FactoryGirl.build(:scribble)).to be_valid
  end
end