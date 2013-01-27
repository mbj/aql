module AQL
  # Abstract base class for aql nodes
  class Node
    include Adamantium, AbstractType

    # Return source representation
    #
    # @return [String]
    #
    # @api private
    #
    def to_aql
      emitter = Buffer.new
      emit(emitter)
      emitter.content
    end

  private

    # Emit aql
    #
    # @param [Emitter] emitter
    #
    # @return [undefined]
    #
    # @api private
    #
    abstract_method :emit

  end
end
