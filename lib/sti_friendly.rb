require 'active_support'
require 'active_record'
require 'sti_friendly/version'

module StiFriendly
  extend ActiveSupport::Concern

  module ClassMethods
    def inherited(base)
      super
      base.send :include, Module.new { base.inheritance_column = :nil }
    end
  end

  # Public: Замена одного класса на другой с сохранением аттрибутов предыдущего экземпляра класса.
  #
  # Фиксирование becomes версии 3.1 рельсов:
  #   http://apidock.com/rails/v3.1.0/ActiveRecord/Persistence/becomes
  #
  # В рельсах более поздних версий, было добавлено копирование ошибок, определение которых
  # основывается не на текущем экземпляре, а на том, что находится в @base у Errors, а он остаётся прежним.
  #
  # klass - Class, класс в который преобразовывается self.
  #
  # Returns Instance of klass.
  def change_sti_type(klass)
    became = klass.new
    became.instance_variable_set('@attributes', @attributes)
    became.instance_variable_set('@attributes_cache', @attributes_cache)
    became.instance_variable_set('@new_record', new_record?)
    became.instance_variable_set('@destroyed', destroyed?)
    became.type = klass.name unless self.class.descends_from_active_record?
    became
  end
end
