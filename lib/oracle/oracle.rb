require 'oci8'

def connect(host,user,password,database)
  @con = OCI8.new(user,password,host+'/'+database)
end

def query(sql,show_column_names=true)
  @result = []
  cursor = @con.exec(sql)
  if show_column_names
    if cursor.get_col_names
      @result.push(cursor.get_col_names)
    end
  end
  while res = cursor.fetch()
    @result << res
  end
  cursor.close
  @result
end

def prints
  puts @result.map{|r| r.join("\t")} unless @result.nil?
end
def expt2csv(filename)
  file = File.new(filename,'w')
  @result.map{|r| f.puts(r.join(","))}
end

def tableinfo(database_table)
  cursor = @con.exec("select * from #{database_table}")
  cursor.column_metadata.each{ |md| puts "#{md.name}\t#{md.type_string}"}
  puts "-"*30
  query "select column_name,comments from all_col_comments where table_name = '#{database_table}'".upcase, false
  prints
  puts '-'*60
end
