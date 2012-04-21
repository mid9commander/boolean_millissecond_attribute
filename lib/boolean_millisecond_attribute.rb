module BooleanMillisecondAttribute
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def boolean_millisecond_attribute(*millisecond_fields)
      millisecond_fields.each do |field|
        boolean_field = field.to_s.gsub(/_at$/, "")
        class_eval <<-"end_eval", __FILE__, __LINE__
          def #{boolean_field}=(value)
            if (value == true || value == 'true' || value == 1 || value == '1')
              self.#{field} = Time.now.to_i if !#{boolean_field}?
            else
              self.#{field} = 0 if #{boolean_field}?
            end
            #{field}
          end

          def #{field}
            #{boolean_field}? ? (read_attribute :#{field}) : nil
          end

          def #{field}_datetime
            #{boolean_field}? ? Time.at(read_attribute(:#{field})) : nil
          end

          def #{boolean_field}?
            !(read_attribute :#{field}).zero?
          end
          alias_method :#{boolean_field}, :#{boolean_field}?

          def #{boolean_field}!
            update_attribute :#{field}, Time.now.to_i
          end
        end_eval
      end
    end
  end
end

ActiveRecord::Base.send(:include, BooleanMillisecondAttribute)
