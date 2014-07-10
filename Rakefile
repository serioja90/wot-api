require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs += ["test","lib"]
  t.name = :test
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "Run tests"
task :default => :test