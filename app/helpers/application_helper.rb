module ApplicationHelper

  # 2023910271
  def format_phone_number(number)
    "(#{number[0..2]}) #{number[3..5]}-#{number[6..9]}"
  end
end
