class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def delete
    self.has_attribute?(:is_active) ? self.update(is_active: false) : super
  end
end
