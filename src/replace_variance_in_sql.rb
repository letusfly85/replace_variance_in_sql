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

    def replace_kbn_const_java_field(map)
        str = ""
        bl_path = File::join('input', $ini['files']['bl_file_name'])
        bl_file = File::open(bl_path, 'r')

        prefix = 'KbnConst.'
        suffix = '}'
        bl_file.each do |line|
            if /KbnConst/ =~ line.chomp
                key    =  line.chomp.scan(/#{prefix}([A-Z0-9_]*)#{suffix}/)[0][0]
                target = '${_' + prefix + key + suffix
                str += line.chomp.sub(target, "'" + map[key] + "'")

            else
                str += line.chomp
            end
        end

        return str
    end

    def generate_replaced_file(str)
        output_path = File::join('output', $ini['files']['bl_file_name'])
        output_file = File::open(output_path, 'wb')

        output_file.puts str
        output_file.close
    end
end
