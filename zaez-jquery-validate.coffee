###

sdf

###

(($)->
	zaez =
		validate:
			defaults:
				###
				taken from the plugin h5validate
				@link http://ericleads.com/h5validate
				HTML5-compatible validation pattern library that can be extended and/or overriden.
				###
				patterns:
					# **TODO: password
					phone: /([\+][0-9]{1,3}([ \.\-])?)?([\(]{1}[0-9]{3}[\)])?([0-9A-Z \.\-]{1,32})((x|ext|extension)?[0-9]{1,4}?)/

					# Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/email_address_validation/
					email: /((([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-zA-Z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?/

					# Shamelessly lifted from Scott Gonzalez via the Bassistance Validation plugin http://projects.scottsplayground.com/iri/
					url: /(https?|ftp):\/\/(((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-zA-Z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-zA-Z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?/

					# Number, including positive, negative, and floating decimal. Credit: bassistance
					number: /-?(?:\d+|\d{1,3}(?:,\d{3})+)(?:\.\d+)?/

					# Date in ISO format. Credit: bassistance
					dateISO: /\d{4}[\/\-]\d{1,2}[\/\-]\d{1,2}/

					alpha: /[a-zA-Z]+/
					alphaNumeric: /\w+/
					integer: /\d+/

				errorMessages:
					required			: "Este campo não pode ficar em branco"
					phone					: "Informe um telefone válido"
					email					: "Informe um email válido"
					url						: "Informe uma url válida"
					alphaNumeric	: "Este campo deve conter apenas text e números"
					alpha					: "Este campo deve conter apenas texto"
					integer				: "Este campo deve conter números"
					maxlength			: "Este campo ultrapassou o tamanho maximo"
					minlength			: "Este campo não tem o tamanho mínimo"

				functions : {}
				
				classActive				: 'active-field'
				classError				: 'error-field'
				classValid				: 'valid-field'
				defaultPrefixData	: 'zvalidate'
				
				fieldSelectors	: ':input:visible:not(:button):not(:disabled):not(.novalidate):not(:submit)'
				focusout				: true
				focusin					: false
				change					: true
				keyup						: false
				
				runSubmitIsValid	: true
				
				focusFirstInvalidElementOnSubmit	: true
				
				# When submitting, validate elements that haven't been validated yet?
				validateOnSubmit	: true

				# Using Debug mode
				debug	: false
				
				# Callback stubs
				invalidCallback	: ->
				validCallback		: ->
				
				# Mark field invalid.
				markInvalid: (params)->
					element = $ params.element
					params.settings.unmark params
					if element.data "errorMessage"
						element.data 'title', element.data "errorMessage"
					else
						element.data 'title', params.settings.errorMessages[params.error]
					element.tooltip()
					element.addClass params.settings.classError
					params.settings.invalidCallback params
					element.bind 'focusin.zvalidate', ->
						$(@).tooltip 'show'
					element.bind 'focusout.zvalidate', ->
						$(@).tooltip 'hide'

				# Mark field valid
				markValid: (params)->
					element = $ params.element
					params.settings.unmark params
					element.addClass params.settings.classValid
					params.settings.validCallback params

				unmark: (params)->
					element = $ params.element
					element.tooltip 'destroy'
					element.removeData 'title'
					element.removeData 'original-title'
					element.removeData 'errorMessage'
					element.removeClass params.settings.classError
					element.removeClass params.settings.classValid

	class ZValidate
		constructor: (@form, @settings)->
			@patterns				= @settings.patterns
			@errorMessages	= @settings.errorMessages
			@functions			= @settings.functions
			@form.data 'zvalidate', @
			@setElements()
			@unsetAllEventsElements()
			@setClassConfiguration()
			@setAllEvents()
		getDataParams: ->
			{
				object				: @
				settings			: @settings
				patterns			: @patterns
				errorMessages	: @errorMessages
				functions			: @functions
			}
		getOptsOfElement: (element)->
			opts = new Object
			opts.validate = []
			for pattern of @patterns
				if element.data("#{@settings.defaultPrefixData}-#{pattern}")
					opts.validate.push pattern
			opts.validate.push 'required'  if element.attr 'required'
			opts.validate.push 'maxlength' if element.attr 'maxlength'
			opts.validate.push 'minlength' if element.attr 'minlength'
			opts.validate.push 'function'  if element.data "#{@settings.defaultPrefixData}-function"
			opts.maxlength	= element.attr "maxlength" if element.attr "maxlength"
			opts.minlength	= element.attr "minlength" if element.attr "minlength"
			opts.function		= element.data "#{@settings.defaultPrefixData}-function" if element.data "#{@settings.defaultPrefixData}-function"
			opts
		setAllEvents: ->
			@setAllEventsElements()
			@setFormEvent()
		setAllEventsElements: ->
			_this = @
			@elements.each (event)->
				_this.setElementEvent $(@)
		setClassConfiguration: ->
			settings = @settings
			@elements.bind
				'focusin.zvalidate'		: ->
					$(@).addClass			settings.classActive
				'focusout.zvalidate'	: ->
					$(@).removeClass	settings.classActive
		setElements: ->
			@elements = @form.find @settings.fieldSelectors
		setElementEvent: (element)->
			_this = @
			opts = @getOptsOfElement element
			element.bind('change.zvalidate', ->
				_this.validate element, opts ) if @settings.change
			element.bind('focusout.zvalidate', ->
				_this.validate element, opts ) if @settings.focusout
			element.bind('focusin.zvalidate', ->
				_this.validate element, opts ) if @settings.focusin
			element.bind('keyup.zvalidate', ->
				_this.validate element, opts ) if @settings.keyup
		setFormEvent: ->
			if @settings.validateOnSubmit
				settings = @settings
				@form.submit ->
					if not $.zaezValidate.validateForm $(@)
						return false
					settings.runSubmitIsValid
		unsetAllEventsElements: ->
			@elements.each ->
				$(@).unbind('.zvalidate')
		validate: (element, opts)->
			if @settings.debug and window.console
				console.log [
					"Options of element:"
					element
					opts
				]
			if opts.validate.length
				for item, k of opts.validate
					if @settings.debug and window.console
						console.log "Test key validate: #{k}"
					r = @validateFunction	element, opts					if k == 'function'
					r = @validateRequired	element								if k == 'required'
					r = @validateLength		element, true,  opts	if k == 'maxlength'
					r = @validateLength		element, false, opts	if k == 'minlength'
					r = @validatePattern	element, @patterns[k]	if @patterns.hasOwnProperty(k)
					if not r
						@settings.markInvalid
							element	: element
							error		: k
							settings: @settings
						return false
			@settings.markValid 
				element	: element
				settings: @settings
			true
		# Advised to use along with the function isEmpty
		validateRequired: (element)->
			if @settings.debug and window.console
				console.log [
					"Validate called on '#{element.val()}', for required."
					"Required test: #{(element.val()!='')}, required"
				]
			if typeof isEmpty == "function"
				not isEmpty element.val()
			else
				(element.val()!='')
		validateFunction: (element, opts)->
			value = element.val()
			func = opts.function
			if @settings.debug and window.console
				console.log [
					"Validate called on '#{value}' with function '#{func}'"
					"Return test: #{@functions[func] element, opts }, by Function: '#{func}'"
				]
			@functions[func] element, opts
		validateLength: (element, type, opts)->
			value = element.val()
			if type
				if @settings.debug and window.console
					console.log [
						"Validate called on '#{value}', with maxlength '#{opts.maxlength}'"
						"Return test: #{(value.length <= opts.maxlength)}, with maxlength: '#{opts.maxlength}'"
					]
				(value.length <= opts.maxlength)
			else
				if @settings.debug and window.console
					console.log [
						"Validate called on '#{value}', with minlength '#{opts.minlength}'"
						"Return test: #{(value.length >= opts.minlength)}, with minlength: '#{opts.minlength}'"
					]
				(value.length >= opts.minlength)
		validatePattern: (element, pattern)->
			re = new RegExp pattern
			value = element.val()
			if @settings.debug and window.console
				console.log [
					"Validate called on '#{value}' with regex '#{re}'."
					"Regex test: #{re.test(value)}, Pattern: #{pattern}"
				]
			re.test value

	$.zaezValidate = 
		addPattern: (pattern)->
			for key of pattern
				zaez.validate.defaults.patterns[key] = pattern[key] if pattern.hasOwnProperty(key)
			zaez.validate.defaults.patterns
		addErrorMessage: (errorMessage)->
			for key of errorMessage
				zaez.validate.defaults.errorMessages[key] = errorMessage[key] if errorMessage.hasOwnProperty(key)
			zaez.validate.defaults.errorMessages
		addFunction: (func)->
			for key of func
				zaez.validate.defaults.functions[key] = func[key] if func.hasOwnProperty(key)
			zaez.validate.defaults.functions
		validateForm: (form)->
			_this = form.data 'zvalidate'
			_return = true
			_this.elements.each ->
				return if not _return
				element = $ @
				opts = _this.getOptsOfElement element
				if not _this.validate element, opts
					_return = false
					element.focus() if _this.settings.focusFirstInvalidElementOnSubmit
			_return
		is_to_test: (@element)->
			@element.data('zvalidate') != true
		

	# Só deve ser executado em um objeto DOM do tipo form
	$.fn.zvalidate = (settings)->
		settings = $.extend true, zaez.validate.defaults, settings
		form = $ @
		new ZValidate form, settings
		true
)(jQuery)