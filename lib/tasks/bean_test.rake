
desc "Test beans because ID isn't pulling"
task :test_beans => :environment do
   @beans = Bean.all
   ap @beans.price
end