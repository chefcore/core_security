require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'foodcritic'

# Style tests. Rubocop and Foodcritic
namespace :style do
  desc 'Run Ruby style checks'
  RuboCop::RakeTask.new(:ruby)

  desc 'Run Chef style checks'
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

desc 'Lint Tests'
task style: %w(style:chef style:ruby)

desc 'Unit Tests'
task spec: %w(spec)

desc 'CI Tests'
task ci: %w(style)

desc 'Default Tests'
task default: %w(style)
