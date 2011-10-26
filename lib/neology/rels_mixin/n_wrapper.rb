module Neology

  module RelsMixin

    class NWrapper

      def initialize relationship_declaration
        @relationship_declaration = relationship_declaration
        @wrapper_array            = []
      end

      def << wrapper
        if wrapper.respond_to?(:each)
          wrapper.each { |wrapper_item|
            add_wrapper wrapper_item
          }
        else
          add_wrapper wrapper
        end

      end

      def size
        @wrapper_array.size
      end

      def include? element
        @wrapper_array.include? element
      end

      def each &block
        @wrapper_array.each do |wrapper|
          block.call wrapper.destination_wrapper
        end
      end

      def to_a
        @wrapper_array.to_a
      end

      def to_ary
         @wrapper_array.to_ary
      end

      private

      def add_wrapper wrapper
        @relationship_declaration.validate! wrapper
        @wrapper_array<< wrapper
      end

    end

  end

end