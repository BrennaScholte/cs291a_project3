class Comment < ApplicationRecord
    belongs_to :post

    # Validations
    validate :body_blacklist

    BLACKLIST = ["Trump", "Donald Trump", "MAGA", "Kamala", "Kamala Harris", "election", "Witch hunt", "Make America Great Again", "The radical left"]
    private
    def body_blacklist
        if BLACKLIST.any? { |word| body.downcase.include?(word.downcase) }
            errors.add(:body, "Comment may potentially influence the election. Not allowed")
        end
    end
end
