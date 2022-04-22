# frozen_string_literal: true

require "rspec/core/rake_task"
require "rubocop/rake_task"

desc "Run specs from spec/"
RSpec::Core::RakeTask.new("spec") do |task|
  task.verbose = false
end

desc "Run RuboCop"
RuboCop::RakeTask.new("rubocop")

task default: %i[spec rubocop]
