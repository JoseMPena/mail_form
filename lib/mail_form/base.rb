module MailForm
  class Base
    include ActiveModel::AttributeMethods
    include ActiveModel::Conversion
    include ActiveModel::Validations
    extend ActiveModel::Naming
    extend ActiveModel::Translation
    
    attribute_method_prefix 'clear_'
    attribute_method_suffix '?'
    attribute_method_affix prefix: 'reset_', suffix: '_to_default'
    
    class_attribute :attribute_names
    self.attribute_names = []

    def deliver
      valid? ? MailForm::Notifier.contact(self).deliver : false
    end
    
    def persisted?
      false
    end
    
    def self.attributes(*names)
      attr_accessor(*names)
      define_attribute_methods(names)
      
      self.attribute_names += names
    end
    
    protected

    def clear_attribute(attribute)
      send("#{attribute}=", nil)
    end

    def attribute?(attribute)
      send(attribute).present?
    end

    def reset_attribute_to_default(attribute)
      send("#{attribute}=", 'default')
      #TODO: store away default values
    end
  end
end