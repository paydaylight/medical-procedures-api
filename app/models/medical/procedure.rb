class Medical::Procedure < ApplicationRecord
  # Relations
  has_ancestry
  has_many :node_children, class_name: 'Medical::Procedure', foreign_key: 'ancestry'

  # Validation
  validates_presence_of :name

  # Pg search
  include ::PgSearch::Model

  pg_search_scope :search, against: [:name], using: {
      tsearch: {
          dictionary: "english",
          normalization: 2,
          prefix: true
      }
  }

  # Class methods
  def self.preload_children
    preload(:node_children)
  end
end
