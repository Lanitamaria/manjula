class Baby < ApplicationRecord
    has_many :breastfeedings, dependent: :destroy

    
    def total_drinking
        breastfeedings.sum(:quantity)
    end

    def total_times
        breastfeedings.sum(:duration)
    end

    #transform object to name
    def to_s
        name.to_s
    end

    #times feedings today
    def breast_feeding_times_today
        breastfeedings.where('created_at >= :start_date AND created_at <= :end_date', {start_date: Time.now.beginning_of_day, end_date: Time.now}).count
    end
    #last time feeding today
    def last_time
        if breastfeedings.count > 0
            breastfeedings.last.created_at
        else
            ''
        end
    end

    #total duration feeding today
    def breast_feeding_duration_today
        breastfeedings.where('created_at >= :start_date AND created_at <= :end_date', {start_date: Time.now.beginning_of_day, end_date: Time.now}).sum(:duration)
    end

    #total duration feeding today
    def breast_feeding_quantity_today
        breastfeedings.where('created_at >= :start_date AND created_at <= :end_date', {start_date: Time.now.beginning_of_day, end_date: Time.now}).sum(:quantity)
    end

end