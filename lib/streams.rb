class LifeStream
  #TODO this is where things like initial pull, and general requests will be made, cron will point here

  def update(service=nil)
    if service.blank?
      for service in self.service_list
        self.service_loop(service)
      end
    else
      self.service_loop(service)
    end
  end
  
  def service_loop(service)
    case service[:name]
    when "twitter"
      client = Tweets.new
      for tweet in client.fetch_formatted(service[:username])
        Twitter.create(
          :t_id => tweet[:id],
          :text => tweet[:text],
          :url => tweet[:url],
          :created_at => tweet[:created_at]
        )
      end
    end
  end
  
  def service_list
    services = []
    Service.all.each do |service|
      services.push({:name => service.name, :username => service.username})
    end

    return services
  end
  
end