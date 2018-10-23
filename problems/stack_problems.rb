=begin
  *Problem* - How stacks can be used for checking balancing of symbols.
=end

require_relative '../programs/stack/stack_with_linked_list.rb'

module Problem
  class SymbolBalance
    attr_accessor :input, :balanced
    
    def initialize
      @input = ''
      @balanced = true
      @stack = Stack.new
    end

    def input_expression
      @input = ''
      @balanced = true
      @stack = Stack.new
      print 'Enter the expression for balance checking of symbols : '
      @input = gets.chomp
    end
    
    def balanced?
      if @input.length == 0
        puts 'Nothing entered!'
      else
        @input.chars.each do |char|
          if [')', '}', ']'].include?(char)          
            case char
            when ')'
              @balanced = false if @stack.pop != '('
            when '}'
              @balanced = false if @stack.pop != '{'
            else
              @balanced = false if @stack.pop != '['
            end
          elsif ['(', '{', '['].include?(char)
            @stack.push(char)
          end
        end
        if @stack.length == 0
          if @balanced
            puts 'Balanced'
          else
            puts 'Not Balanced'
          end  
        else
          puts 'Not Balanced'
        end
      end
    end
  end
end