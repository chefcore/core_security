require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'RuboCop'
  RuboCop::RakeTask.new(:ruby)

  desc 'FoodCritic'
  FoodCritic::Rake::LintTask.new(:chef) do |t|
    t.options = {
        fail_tags: ['correctness'],
        chef_version: '12.5.1',
        tags: %w(~FC001 ~FC019)
    }
  end
end

# Rspec and ChefSpec
desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

desc 'Lint Tests (FoodCritic and RuboCop)'
task lint: %w(style:chef style:ruby)

desc 'Unit Tests (Rspec & ChefSpec)'
task unit: %w(spec)

desc 'CI Tests (FoodCritic and RuboCop)'
task ci: %w(style:chef style:ruby)

desc 'Default Tests (FoodCritic and RuboCop)'
task default: %w(style:chef style:ruby)
