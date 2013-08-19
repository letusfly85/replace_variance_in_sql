task :init do
    $:.unshift File::dirname(__FILE__)
    require 'setup'
end

task :replace => [:init] do
    include ReplaceVarianceInSQL

    map = load_kbn_const_java
    map.each do |k, v|
        puts k, v
    end
end

