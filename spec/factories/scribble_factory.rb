FactoryGirl.define do
  factory :scribble do
    image File.open(File.join(Rails.root, "files/ruby.png"))
    artist_email 'fake666@example.com'
  end
end