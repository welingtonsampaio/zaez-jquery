(($)->
	zaez = 
		list: 
			defaults:
				# All configurations
				useLiSelector	: true
				defaultEvent	: 'click'
				defaultFn			: 'show'
				addClass			: true
				defaultClass	: 'active'
				debug					: false
				# dataset configurations
				dataset:
					target	: "zlistTarget"
					fn			: "zlistFunction"
					event		: "zlist"
				# functions
				fn:
					show	: (element, target, __class__)->
						__class__.debug "Executing function show in: #{target}"
						$(target, __class__.elements).not(target, element).addClass 'hidden'
						$(target, element).removeClass 'hidden'
	# aliases
	defaults = zaez.list.defaults
	class ZList
		# attributes
		debugMessage	: 0
		className			: 'ZList'
		namespace			: '.zlist'
		# methods
		constructor: (@list, @settings)->
			@setElements()
			@unsetEvent()
			@setEvent()
		addClass: (element)->
			@debug "Adding css class '#{@settings.defaultClass}' to the element that triggered the event"
			element.addClass @settings.defaultClass
		debug: ->
			if @settings.debug and window.console
				message = ["#{@className} - #{@debugMessage}"]
				message.push value for value in arguments
				console.log message
				@debugMessage += 1
		removeClass: ->
			@debug "Removing the CSS class '#{@settings.defaultClass}' of all elements"
			@elements.removeClass @settings.defaultClass
		setElements: ->
			@debug 'Setting elements of interaction with the class'
			@elements = if @settings.useLiSelector then @list.find('li') else @list
		setEvent: ->
			_this = @
			settings = @settings
			@elements.each ->
				element	= $ @
				target	= element.data settings.dataset.target
				fn 			= element.data settings.dataset.fn
				event		= if element.data(settings.dataset.event) then element.data(settings.dataset.event) else settings.defaultEvent
				_this.debug "Getting the configuration by dataset", "target : #{target}", "fn     : #{fn}", "event  : #{event}"
				element.bind event+_this.namespace, ->
					_this.debug "Configuration testing to see whether to use CSS class, with value: '#{settings.addClass}'"
					if settings.addClass
						_this.removeClass()
						_this.addClass element

					if settings.fn.hasOwnProperty(fn)
						_this.debug "Running '#{fn}', with the parameters", element, target, _this
						settings.fn[fn](element,target, _this)
					else
						_this.debug "The function '#{fn}' does not exist in settings", settings.fn
						_this.debug "Running '#{settings.defaultFn}', with the parameters", element, target, _this
						settings.fn[settings.defaultFn](element,target, _this)
		unsetEvent: ->
			@debug "Clearing events with namespace: '#{@namespace}'"
			@elements.unbind @namespace
	$.zaezList = 
		getDefaults: ->
			defaults
		updateDefaults: (settings)->
			defaults = $.extend true, defaults, settings
			defaults
	$.fn.zlist = (settings)->
		settings = $.extend true, defaults, settings
		new ZList @, settings
)(jQuery)