namespace :db do
	desc "Fill database with sample data"

	task populate: :environment do
    plan = Plan.create!( name: "Emmanuel Serna",
                         email: "eserna27@gmail.com",
                         company: "JazzHealthCare",
                         password: "41534153",
                         password_confirmation: "41534153")
                         
	end

end