FactoryGirl.define do
  factory :post do
    header "Новый пост"
    reading_time "10"
    excerpt "Краткое содержание этого поста"
    body "Новый пост, написанный специально для этого теста. Ничего особенного, просто пост."
  end
end
