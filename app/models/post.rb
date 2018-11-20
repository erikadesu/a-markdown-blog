class Post < ApplicationRecord
  validates :content_raw, presence: true
  after_save :htmlize, if: :saved_change_to_content_raw?
  belongs_to :user

  private

  def htmlize
    HtmlizeJob.perform_later(self.id)
  end
end
