require "rails_helper"

RSpec.feature "Visitors can see images attached to posts" do
  let(:post) {FactoryGirl.create :post}
  let!(:image) {FactoryGirl.create :image, post: post, file_to_attach: "spec/fixtures/image1.png"}

  scenario "successfully" do
    visit post_path(post)
    click_link "image1.png"

    expect(current_path).to eq image_path(image)
  end
end
