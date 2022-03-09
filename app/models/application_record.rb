class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  
  def delete
    self.has_attribute?(:is_active) ? self.update(is_active: false) : super
  end
end
