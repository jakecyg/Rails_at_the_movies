require 'csv'

Movie.delete_all
ProductionCompany.delete_all

filename = Rails.root.join('db/top_movies.csv')

puts "Loading source csv from: #{filename}"

csv_data = File.read(filename)
movies = CSV.parse(csv_data, headers: true, encoding: 'utf-8')

movies.each do |m|
  production_company = ProductionCompany.find_or_create_by(name: m['production_company'])

  if production_company&.valid?
    movie = production_company.movies.create(
      title: m['original_title'],
      year: m['year'],
      duration: m['duration'],
      description: m['description'],
      average_vote: m['avg_vote']
    )
  else
    puts "Invalid production company: #{production_company} for the movie #{m['original_title']}."
  end
end
puts "Created #{ProductionCompany.count} production companies"
puts "Created #{Movie.count} movies"
