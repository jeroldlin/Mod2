class CheckPhoneNumberValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
    unless value =~ /^[2-9]\d{2}-\d{3}-\d{4}$/
      object.errors[attribute] << (options[:message] || "format is xxx-xxx-xxxx with first digit from 2 to 9") 
    end
  end
end