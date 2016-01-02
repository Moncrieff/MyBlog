require "rails_helper"

RSpec.feature "Visitors can view posts" do
  scenario "with the post details" do
    post = FactoryGirl.create(:post, header: "Первая запись")

    visit "/"
    click_link "Первая запись"
    expect(page.current_url).to eq post_url(post)
  end
end
