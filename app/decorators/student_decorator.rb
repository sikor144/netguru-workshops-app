class StudentDecorator < BaseDecorator
  def full_name
    "#{first_name} #{last_name}"
  end

  def avg_notes(subject_item)
    ret_value = (subject_item.subject_item_notes.count > 0) ? "%.2f" % BigDecimal(subject_item.subject_item_notes.average(:value)).truncate(2) : "0.00"
    ret_value
  end
end
