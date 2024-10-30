class Post < ApplicationRecord
    belongs_to :user

    # Validations
    validate :body_blacklist

    # TODO: add more blacklisted words
    BLACKLIST = ["Trump", "Donald Trump", "MAGA", "Kamala", "Kamala Harris", "election"]
    private
    def body_blacklist
        if BLACKLIST.any? { |word| body&.include?(word) }
            errors.add(:body, "Post may potentially influence the election. Not allowed")
        end
    end
end
