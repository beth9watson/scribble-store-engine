require 'spec_helper'

describe ScribbleStore::Scribble do

  context 'source scribble' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:scribble)).to be_valid
    end

    it 'has no source_scribble_id' do
      expect(FactoryGirl.build(:scribble).source_scribble_id).to be_nil
    end
  end

  context 'response scribble' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:response_scribble)).to be_valid
    end 

    it 'has a source_scribble_id' do
      expect(FactoryGirl.build(:response_scribble).source_scribble_id).to_not be_nil
    end
  end 

  it 'is valid without an artist email' do
    expect(FactoryGirl.build(:scribble, artist_email: nil)).to be_valid
  end 

  it 'is invalid without an image' do
    expect(FactoryGirl.build(:scribble, image: nil)).to_not be_valid
  end 
end