class Estimation
  def self.counting(count, with_number = nil, one = 'балл', several = 'балла', many = 'баллов')
    form =
      if (11..14).cover?(count % 100)
        many
      elsif count % 10 == 1
        one
      elsif (2..4).cover?(count % 10)
        several
      else
        many
      end

    prefix = with_number ? '' : " #{form}"

    count.to_s + prefix
  end
end
