class Event < ApplicationRecord
  validates_presence_of :name

  def save_for_bulk_import!(options = {} )
    self.skip_uniqueness = true
    save! options
  end
end
