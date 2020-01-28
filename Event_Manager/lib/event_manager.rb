require 'csv'

require 'sunlight/congress'

require 'erb'



def clean_zipcode(zipcode)

  zipcode.to_s.rjust(5, "0")[0..4]

end



def legislators_by_zipcode(zipcode)

  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)

      # just for exercise:

      # legislators_list = Proc.new do |legislator|

      #   "#{legislator.first_name} #{legislator.last_name}, website: #{legislator.website}"

      # end

      # legislator_names = legislators.collect(&legislators_list)

  # legislator_names = legislators.collect do |legislator|

  #   "#{legislator.first_name} #{legislator.last_name}"

  # end

  # legislator_names.join(", ")

end



def create_letter_file(id, form_letter)

  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename, 'w') do |file|

    file.puts(form_letter)

  end

end



def validate(phone_number)

  if phone_number.nil? || phone_number.length < 10 || phone_number.length > 11

    phone_number = "Invalid number"

  elsif phone_number.length == 11 && phone_number[0] == "1"

    phone_number = phone_number[(1..10)]

  elsif phone_number.length == 11 && phone_number[0] != "1"

    phone_number = "Invalid number"

  else

    phone_number

  end

end



def store_visit_time(name, last_name, city, id)

  register_time = Time.now.strftime('%H%M').to_i

  weekday = Time.now.wday

  CSV.open("reports/register_time_report.csv", "a") do |csv|

    csv << [weekday, register_time, name, last_name, city, id]

  end

end



Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

template_letter = File.read("../form_letter.erb")

erb_template = ERB.new(template_letter)



contents = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)



contents.each do |row|

  id = row[0]

  name = row[:first_name]

  last_name = row[:last_name]

  city = row[:city]

  zipcode = clean_zipcode(row[:zipcode])

  legislators = legislators_by_zipcode(zipcode)

  form_letter = erb_template.result(binding)

  create_letter_file(id, form_letter)

  home_phone = validate(row[:homephone].gsub(/[^0-9]/, ''))

  store_visit_time(name, last_name, city, id)

end