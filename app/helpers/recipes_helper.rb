module RecipesHelper

	def link_to_add_fields(name = nil, f = nil, association = nil, options = nil, html_options = nil, &block)
		f, association, options, html_options = name, f, association, options if block_given?
		options = {} if options.nil?
		html_options = {} if html_options.nil?

		if options.include? :locals
			locals = options[:locals]
		else
			locals = { }
		end

		if options.include? :partial
			partial = options[:partial]
		else
			partial = association.to_s.singularize + '_fields'
		end

		new_object = f.object.class.reflect_on_association(association).klass.new
		fields = f.fields_for(association, new_object, child_index: 'new_record') do |builder|
			render(partial, locals.merge!( f: builder))
		end

		html_options['data-form-prepend'] = raw CGI::escapeHTML( fields )
		html_options['href'] = '#'
		content_tag(:a, name, html_options, &block)
	end

end
