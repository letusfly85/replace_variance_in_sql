# encoding: utf-8

module ReplaceVarianceInSQL
    
    def load_kbn_const_java
        kbn_const_java = File::open($ini['files']['kbn_const_java'], 'r')

        map = {}
        kbn_const_java.each do |line|
            next unless /public/ =~ line.chomp

            ary = line.chomp.split("\s")
            
            unless (ary[6].nil?)
                map.merge!({ary[4] => ary[6].gsub('"', '').sub(';', '')})
            else
                nil
            end
        end

        return map
    end

    def replace_kbn_const_java_field
        bl_file = File::open($ini['files']['bl_file_path'], 'r')

        bl_file.each do |line|
            if /KbnConst/ =~ line.chomp
                puts line.chomp
            end
        end
    end
end
