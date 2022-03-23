class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        #binding.pry
       self.subscriptions.create(magazine: magazine, price: price)
        
    end

    def total_subscription_price
        self.subscriptions.pluck(:price).sum
    end

    def cancel_subscription(magazine)
        s1 = self.subscription.find_by(magazine: magazine)
        s1.detroy
    end
end


# def self.delete_by_id(id)
#     movie = Movie.find(id)
#     movie.destroy
#   end