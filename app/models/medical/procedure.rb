class Medical::Procedure < ApplicationRecord
  has_ancestry
  validates_presence_of :name
  include ::PgSearch::Model

  pg_search_scope :search, against: [:name], using: {
      tsearch: {
          dictionary: "english",
          normalization: 2,
          prefix: true
      }
  }
end
