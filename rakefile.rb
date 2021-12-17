require 'rake/testtask'

Rake::TestTask.new do |task|
 task.pattern = 'tests/test_*.rb'
end