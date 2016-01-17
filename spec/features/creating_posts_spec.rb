require "rails_helper"

RSpec.feature "Users can create blog posts" do
  before do
    visit "/"
    click_link "Новая запись"
  end

  scenario "with valid attributes" do
    fill_in "Тема", with: "Новый пост"
    fill_in "Время чтения", with: "5"
    fill_in "Краткое содержание", with: "Очень коротко о том, что тут будет."
    fill_in "Текст", with: "Новый пост, в котором рассказывается о том, как создать новый пост."
    click_button "Опубликовать"

    expect(page).to have_content "Новая запись успешно опубликована."
    expect(page).to have_content "Новый пост"
  end

  scenario "when providing invalid attributes" do
    click_button "Опубликовать"

    expect(page).to have_content "Запись не была опубликована."
    expect(page).to have_content "Header can't be blank"
  end

  scenario "with an image attachment" do
    fill_in "Тема", with: "Новый пост с картинкой"
    fill_in "Время чтения", with: "7"
    fill_in "Краткое содержание", with: "Очень коротко о том, что тут будет."
    fill_in "Текст", with: "Новый пост, в котором рассказывается о том, как создать новый пост."
    attach_file "Изображение", "spec/fixtures/image.png"
    click_button "Опубликовать"

    expect(page).to have_content "Новая запись успешно опубликована."

    within(".attachment") do
      expect(page).to have_content "image.png"
    end
  end

  scenario "persisting file uploads across form displays" do
    attach_file "Изображение", "spec/fixtures/image.png"
    click_button "Опубликовать"

    fill_in "Тема", with: "Новый пост с картинкой"
    fill_in "Время чтения", with: "7"
    fill_in "Краткое содержание", with: "Очень коротко о том, что тут будет."
    fill_in "Текст", with: "Новый пост, в котором рассказывается о том, как создать новый пост."
    click_button "Опубликовать"

    within(".attachment") do
      expect(page).to have_content "image.png"
    end
  end
end
