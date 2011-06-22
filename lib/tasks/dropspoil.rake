namespace :l2 do
  desc 'Import l2.dropspoil.com into db'
  task :import => :environment do
  
    require 'open-uri'
    require 'nokogiri' 
    Monster.delete_all
    
    url = "http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=&l1=1&l2=100"
    base_url = "http://l2.dropspoil.com"
  
  
    urls = [
      [1,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=&l1=1&l2=100"],
      [0.25, "http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.8&l1=1&l2=100"],
      [0.5, "http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.9&l1=1&l2=100"],
      [2,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.10&l1=1&l2=100"], 
      [3,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.11&l1=1&l2=100"],
      [4,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.12&l1=1&l2=100"],
      [5,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.13&l1=1&l2=100"],
      [6,"http://l2.dropspoil.com/?action=db&what=lnpc&button=Show&type=Monster&aggro=any&sid=4408.14&l1=1&l2=100"],
    ]
  
  
  
    urls.each do |url_data|
    Monster.transaction do
      mult = url_data[0]
      url = url_data[1]
      
    root = Nokogiri::HTML(open(url))
    #Searching for all rows with monster location and hp multiplier
    root.xpath("//td/a[starts-with(@title,'Locate')]/../..").each do |monster| 
      data = {} 
      data[:name] = monster.children[0].xpath("./a")[0].text
      data[:location] = base_url+monster.children[0].xpath("./a")[1][:href]
      data[:lvl] = monster.children[2].text.to_i
      data[:exp] = monster.children[6].text
      data[:hp] = monster.children[10].text
     
      emonster = Monster.find(:first, :conditions => data)
        if !emonster.blank?
          data[:hp] = emonster.hp*mult
          emonster.update_attributes(data)
          emonster.vitality = emonster.vitality 
          emonster.save
        else
          Monster.create(data)
        end
    end
    
    end

    end
  
  
  end
end
  
  
