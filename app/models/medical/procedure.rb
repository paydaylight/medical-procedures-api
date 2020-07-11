class Medical::Procedure < ApplicationRecord
  has_ancestry
  validates_presence_of :name
end
