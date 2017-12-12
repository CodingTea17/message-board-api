class Seed

  def self.begin
    seed = Seed.new
    seed.generate_groups_with_messages
  end

  def generate_groups_with_messages
    20.times do |i|
      group = Group.create!(
        name: Faker::ProgrammingLanguage.name,
        section: Faker::Hacker.noun
      )
      5.times do |k|
        group.messages.create!(
          :title => Faker::Dune.saying,
          :author => Faker::Dune.character,
          :content => Faker::Dune.quote
        )
      end
      puts "group #{i}: Name is #{group.name}, Section is '#{group.section}'."
    end
  end
end

Seed.begin
