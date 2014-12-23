def workout(function,input_array,step=1000,params: {})
  head = 0
  data_head = 0
  while(head <= input_array.size) do
    function.call(input_array[head,step].join("','"))
    data_head = 1 unless head == 0
    @result[data_head..-1].each do |item|
      item.nil?? (print "","\t"):(item.each {|r| print r,"\t"})
      puts
    end
    head += step
  end
end
