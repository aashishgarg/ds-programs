class StackUnderflow < StandardError
    attr_accessor :message

    def initialize(message)
        @message = message
    end
end

class StackOverflow < StandardError
    attr_accessor :message

    def initialize(message)
        @message = message
    end
end