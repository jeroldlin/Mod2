namespace :export do
  desc "Prints Country.all in a seeds.rb way."
  task :seeds_format => :environment do
    Restaurant.order(:id).all.each do |country|
      puts "Restaurant.create(#{restaurant.serializable_hash.delete_if {|key, value| ['name','description','address','phone_number','created_at','updated_at'].include?(key)}.to_s.gsub(/[{}]/,'')})"
    end
  end
end