(($)->
	zaez = 
		ajax:
			defaults:
				# All configurations
				debug						: false
				returnAfter			: false
				useLoader				: true
				useOnlyError		: true
				# Dataset configurations
				dataset:
					target					: 'zajaxTarget'
					type						: 'zajaxType'
					method					: 'zajaxMethod'
					url							: 'zajaxUrl'
					formid					: 'zajaxFormid'
					event						: 'zajaxEvent'
					useLoader				: 'zajaxUseLoader'
					callbackAlways	: 'zajaxCallbackAlways'
					callbackError		: 'zajaxCallbackError'
					callbackSuccess	: 'zajaxCallbackSuccess'
				loaderShow: ->
				loaderHide: ->
				# functions of returns
				callbacks:
					afterAsync			: (_class_)->
						true
					beforeAsync			: (_class_)->
						true
					callbackError		: (_class_)->
						true
					###
						data: response
						response: message of responde header
						event: event of async message
						settings: configuration the zajax
						_this: the object ZAjax
					###
					callbackSuccess	: (params)->
					callbackAlways	: (_class_)->
					###
						data: response
						response: message of responde header
						event: event of async message
						settings: configuration the zajax
						_this: the object ZAjax
					###
					_200: (params)->
						$(params._this.target).html params.data
					_403: (params)->
						console.log "403"
					_404: (params)->
						console.log "404"
					_422: (params)->
						console.log "422"
					_500: (params)->
						console.log "500"
					error: (params)->
						console.log "outher error"
	# aliases
	defaults	= zaez.ajax.defaults
	callbacks	= defaults.callbacks
	# Class of manipulation
	class ZAjax
		constructor: (@element, @settings)->
			@settings.useLoader = @element.data( @settings.dataset.useLoader ) if @element.data( @settings.dataset.useLoader )
			@settings.callbacks.callbackAlways	= @element.data( @settings.dataset.callbackAlways )		if @element.data( @settings.dataset.callbackAlways	)
			@settings.callbacks.callbackError		= @element.data( @settings.dataset.callbackError )		if @element.data( @settings.dataset.callbackError		)
			@settings.callbacks.callbackSuccess	= @element.data( @settings.dataset.callbackSuccess )	if @element.data( @settings.dataset.callbackSuccess	)
			@element.data 'zajax', @
			@setConfiguration()
			@setEvents()
		setConfiguration: ->
			if ( @settings.debug and window.console )
				console.log "Initializing data configuration of object."
			@event	= if @element.data(@settings.dataset.event)		then @element.data(@settings.dataset.event)		else 'click'
			@type		= if @element.data(@settings.dataset.type)		then @element.data(@settings.dataset.type)		else 'html'
			@target	= if @element.data(@settings.dataset.target)	then @element.data(@settings.dataset.target)	else false
			@method	= if @element.data(@settings.dataset.method)	then @element.data(@settings.dataset.method)	else 'get'
			@formid	= if @element.data(@settings.dataset.formid)	then @element.data(@settings.dataset.formid)	else false
			@url		= if @element.data(@settings.dataset.url)			then @element.data(@settings.dataset.url)			else false
			if not @url and @element.attr('href')
				@url = @element.attr('href')
			if not @url and @formid
				form = $ "##{@formid}"
				@url = form.attr 'action' if form.attr 'action'
			if ( @settings.debug and window.console )
					console.log "data-event   : #{@event}"
					console.log "data-type    : #{@type}"
					console.log "data-target  : #{@target}"
					console.log "data-method  : #{@method}"
					console.log "data-formid  : #{@formid}"
					console.log "data-url     : #{@url}"
		setEvents: ->
			@element.unbind('.zajax').bind 'click.zajax', {class: @, settings: @settings}, @_async
		_async: (event)->
			_this			= event.data.class
			_settings	= event.data.settings
			xhrParams = 
				url: _this.url
				type: _this.method
				dataType: _this.type
			if _this.event == 'submit'
				form = $("##{_this.formid}")
				xhrParams.data = form.serialize()
			return if not _settings.callbacks.beforeAsync _this 
			xhr = $.ajax xhrParams
			_settings.loaderShow() if _settings.useLoader
			xhr.done (data, response, event)->
				params =
					data: data
					response: response
					event: event
					settings: _settings
					_this: _this
				_settings.callbacks._200 params
				_settings.callbacks.callbackSuccess params
				true
			xhr.fail (event, response, header)->
				params =
					data: header
					response: response
					event: event
					settings: _settings
					_this: _this
				console.log params
				func = false
				func = _settings.callbacks._403  if event.status == 403
				func = _settings.callbacks._404  if event.status == 404
				func = _settings.callbacks._422	 if event.status == 422
				func = _settings.callbacks._500  if event.status == 500
				func = _settings.callbacks.error if not func or _settings.useOnlyError
				func params
				_settings.callbacks.callbackError params
				false
			xhr.always ->
				_settings.callbacks.afterAsync()
				_settings.callbacks.callbackAlways _this
				_settings.loaderHide() if _settings.useLoader
			event.data.settings.returnAfter
	
	# Methods Globais
	$.zaezAjax = 
		getDefaults: ->
			defaults
		updateDefaults: (settings)->
			defaults = $.extend true, defaults, settings
			defaults
		addCallback: (func)->
			_default = @getDefaults()
			obj = _default.callbacks
			for key of func
				obj[key] = func[key] if func.hasOwnProperty(key)
			obj
		addDataset: (data)->
			_default = @getDefaults()
			obj = _default.dataset
			for key of data
				obj[key] = func[key] if func.hasOwnProperty(key)
			obj
	$.fn.zajax = (settings)->
		settings = $.extend true, $.zaezAjax.getDefaults(), settings
		$(@).each ->
			new ZAjax $(@), settings
		true
)(jQuery)
