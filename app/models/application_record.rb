# class ApplicationRecord < ActiveRecord::Base
#   primary_abstract_class
# end

class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def self.search(query)
    where("title LIKE ? OR content LIKE ?", "%#{query}%", "%#{query}%")
  end
end