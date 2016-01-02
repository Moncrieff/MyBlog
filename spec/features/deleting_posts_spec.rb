require "rails_helper"

RSpec.feature "Users can delete posts" do
  scenario "successfully" do
    FactoryGirl.create(:post, header: "Запись для удаления")

    visit "/"
    click_link "Запись для удаления"
    click_link "Удалить запись"

    expect(page).to have_content "Запись была успешно удалена."
    expect(page.current_url).to eq posts_url
    expect(page).to have_no_content "Запись для удаления"
  end
end
