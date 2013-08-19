task :init do
    $:.unshift File::dirname(__FILE__)
    require 'setup'
end

task :replace => [:init] do
    include ReplaceVarianceInSQL

    map = load_kbn_const_java
    replace_kbn_const_java_field
end

