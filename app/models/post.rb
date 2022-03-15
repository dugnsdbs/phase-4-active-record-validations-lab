class Post < ApplicationRecord
   validates :title, presence: true
   validates :content, length: { minimum: 250 }
   validates :summary, length: { maximum: 250 }
   validates :category, inclusion: { in: ['Fiction', "Non-Fiction"] }
   
   validate :must_have_words

   def must_have_words
    words = ["Won't Believe","Secret", "Top [number]", "Guess"].map{|word|word}

    # unless title.match?(/Won't Believe/)
   unless words.present?
      errors.add(:title, "These words are not included, Wrong!!")
    end
  end
end
