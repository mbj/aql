module AQL
  # The emit buffer
  class Buffer

    # Initialize object
    #
    # @return [undefined]
    #
    # @api private
    #
    def initialize
      @buffer = []
    end

    # Test if buffer is on empty line
    #
    # @return [true]
    #   if buffer is on empty line 
    #
    # @return [false]
    #   otherwise
    #
    # @api private
    #
    def new_line?
      @buffer.empty? || @buffer.last == "\n"
    end

    # Append content to buffer
    #
    # @param [String] content
    #
    # @return [self]
    #
    # @api private
    #
    def append(content)
      @buffer << content
      self
    end

    # Return content
    #
    # @return [String]
    #
    # @api private
    #
    def content
      @buffer.join.freeze
    end

  end
end
