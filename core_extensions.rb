module Rails
  module Generators
    module Actions

      attr_accessor :stategies
      attr_reader :template_options

      def initialize_templater
        @stategies = []
        @template_options = {}
      end
      
      def execute_stategies
        stategies.each {|stategy| stategy.call }
      end

      def load_options
        @template_options[:design] = ask("Which design framework? [compass(default), none]: ").downcase        
        @template_options[:design] = "compass" if @template_options[:cucomber].blank?
        
        @template_options[:cucomber] = ask("Do you want to some cukes? [yes(default), no]: ").downcase
        @template_options[:cucomber] = "yes" if @template_options[:cucomber].blank?
        
        @template_options[:orm] = options["skip_active_record"] ? "mongoid" : "active_record"
      end

      def recipe(name)
        File.join File.dirname(__FILE__), 'recipes', "#{name}.rb"
      end

      # TODO: Refactor loading of files
      
      def load_snippet(name, group)
        path = File.expand_path name, snippet_path(group)
        File.read path
      end

      def load_template(name, group)
        path = File.expand_path name, template_path(group)
        File.read path
      end      

      def snippet_path(name)
        File.join(File.dirname(__FILE__), 'snippets', name)
      end

      def template_path(name)
        File.join(File.dirname(__FILE__), 'templates', name)
      end

    end
  end
end
