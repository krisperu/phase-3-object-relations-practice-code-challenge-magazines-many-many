class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions
    
        def self.most_popular
            self.all.max_by {|magazine| magazine.subscriptions.count}
        end

    def email_list
        emails = self.readers.map { |r| r.email }
        emails.join(';')
    end
end