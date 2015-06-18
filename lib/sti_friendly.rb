require 'sti_friendly/version'

module StiFriendly
  # Wrapper around becomes that also changes the instance's sti column value.
  # This is especially useful if you want to persist the changed class in your
  # database.
  def becomes!(klass)
    became = becomes(klass)
    sti_type = nil
    sti_type = klass.sti_name unless klass.descends_from_active_record?
    became.public_send("#{klass.inheritance_column}=", sti_type)
    became
  end

  # Updates the associated record with values matching those of the instance attributes.
  # Returns the number of affected rows.
  def update(attribute_names = @attributes.keys)
    attributes_with_values = arel_attributes_values(false, false, attribute_names)
    return 0 if attributes_with_values.empty?
    klass = self.class.base_class
    stmt = klass.unscoped
                .where(klass.arel_table[klass.primary_key].eq(id))
                .arel
                .compile_update(attributes_with_values)
    klass.connection.update(stmt)
  end
end
