module Enumerable
       def my_each
         i = 0
         while i < self.size
           yield(self[i])
           i+=1
         end
         self
       end

       def my_each_with_index
         i = 0
         while i < self.size
           yield(self[i],i)
           i+=1
         end
         self
       end

       def my_select
         result_array = []
         self.my_each do |i|
           yield(i)
          result_array << i
        end
      end

      def my_all?
          result = true
          self.my_each do |i|
            result = false unless yield i
            end
            result
      end

      def my_any?
          result = false
          self.my_each do |i|
            if yield i
              result = true
            end
            result
          end
      end


      def my_none?
          result = false
          self.my_each do |i|
            if yield i
              result = true
            end
            result
          end
      end

      def my_count(*n)
  	     counter = 0
  	      if block_given?
  		        self.my_each {|i| counter+=1 if yield i}
  	      elsif n!=nil
  		        self.my_each {|i|	counter+=1 if yield i==n}
  	      else
  		        self.my_each {|i|	counter+=1}
  	      end
  	      counter
      end

      def my_map(&block)
        result_array = []
        if block_given?
            self.my_each do |i|
            yield(i)
            result_array << i
          end
        elsif
          self.my_each do |i|
          result_array << i.block.call
        end
       end
     end

     def my_inject(result = nil)
        if result.nil?
            result = self[0]
            i = 1
          else
            i = 0
        end

        while i < self.size
          result = yield(result,self[i])
          i += 1
        end
        return result
        end


     def multiply_els
       self.my_inject { |result, element| result * element}
     end

end


proc = Proc.new { |y| puts y }

[1,2,3].my_map(&proc)
