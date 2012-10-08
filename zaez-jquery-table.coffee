
(($)->
	zaez =
		table:
			defaults:
				# All configurations
				childSelector	: "td"
				useTrSelector	: true
				debug					: false
				# dataset configurations
				zLink	: "ztableLink"
				# class
				classDblclick	: ''
				classClick		: 'active'
				classHover		: 'hover'
				# events
				dblclick	: true
				click			: true
				hover			: false
				# functions
				fnDblclick	: (element, settings)->
				fnClick			: (element, settings)->
				fnHover			: (element, settings)->
	#aliases
	defaults	= zaez.table.defaults
	class ZTable
		constructor: (@table, @settings) ->
			@setElements()
			@setEvents()
		setElements: ->
			@elements = $ @settings.childSelector, @table
			@elements = @elements.parent 'tr' if @settings.useTrSelector
			@elements
		getSettings: ->
			@settings
		getDataEvent: ->
			{settings: @settings, class: @}
		setEvents: ->
			if @settings.debug and window.console
				console.log "Remove existents events for tis element in namespace 'ztable'"
				console.log "Initializing events"
				console.log "Setting 'dblclick' for all elements"	if @settings.dblclick
				console.log "Setting 'click' for all elements"		if @settings.click
				console.log "Setting 'hover' for all elements"		if @settings.hover
			@elements.unbind '.ztable'
			@elements.bind( 'click.ztable', @getDataEvent(), (event)->
				settings = event.data.settings
				if settings.debug and window.console
					console.log "Access event onClick"
				if ( $(@).hasClass(settings.classClick) and settings.dblclick )
					event.data.class.elementDblClick event, $(@)
					return false
				event.data.class.cleanElement event.data.class.elements, settings
				$(@).addClass settings.classClick
				settings.fnClick $ @, @settings
			) if @settings.click
			@elements.bind( 'hover.ztable', @getDataEvent(), (event)->
				settings = event.data.settings
				if settings.debug and window.console
					console.log "Access event onHover"
				$(@).addClass settings.classClick
				settings.fnHover $ @, @settings
			) if @settings.hover
		cleanElement: (element, settings = @settings)->
			if settings.debug and window.console
				console.log "Cleaning element"
			element.removeClass settings.classDblclick
			element.removeClass settings.classClick
			element.removeClass settings.classHover
		elementDblClick: (event, element = $(@) )->
			settings = event.data.settings
			if settings.debug and window.console
				console.log "Access event onDblclick"
			event.data.class.cleanElement event.data.class.elements, settings
			element.addClass settings.classDblclick
			window.location = element.data settings.zLink
			settings.fnDblclick $ @, @settings
	$.zaezTable =
		getDefaults: ->
			defaults
		updateDefaults: (settings)->
			defaults = $.extend {}, defaults, settings
			defaults
	$.fn.ztable = (settings)->
		settings = $.extend true, defaults, settings
		new ZTable @, settings

)(jQuery)