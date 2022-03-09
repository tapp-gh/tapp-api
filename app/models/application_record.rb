class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  before_create { self.is_active = true if self.has_attribute?(:is_active) }
  
  def delete
    self.has_attribute?(:is_active) ? self.update(is_active: false) : super
  end
end
