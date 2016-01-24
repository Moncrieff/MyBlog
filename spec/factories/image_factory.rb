FactoryGirl.define do
  factory :image do
    transient do
      file_to_attach "spec/fixtures/image1.png"
    end

    file { File.open file_to_attach }
  end
end
