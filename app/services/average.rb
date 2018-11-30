class Average
  def initialize()
  end

  def compute_average_all
    Coffee.all.each do |coffee|
      sum = 0
      coffee.reviews.each do |review|
        sum += review.rating.to_i
      end
      coffee.update(grade: coffee.reviews.count > 0 ? (sum / coffee.reviews.count).round.to_i : 0)
    end
  end

  def compute_average_one(coffee)
    sum = 0
    coffee.reviews.each do |review|
      sum += review.rating.to_i
    end
    coffee.update(grade: coffee.reviews.count > 0 ? (sum / coffee.reviews.count).round.to_i : 0)
  end
end
