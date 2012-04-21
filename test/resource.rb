class Resource < ActiveRecord::Base
  boolean_millisecond_attribute :deleted_at
end
