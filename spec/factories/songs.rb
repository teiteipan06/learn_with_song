FactoryBot.define do
  factory :song do
    title                 {"songtitle"}
    video                 {"test"}
    singer                {"mayday"}
    category              {"pop"}
    lyrics_origin         {"hello"}
    lyrics_japanese       {"こんにちは"}

    association :user
    
  end
end
