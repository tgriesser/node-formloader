/*jshint curly:false, eqnull:true, node:true, laxcomma:true, white:false */

// All configuration options for the application
module.exports = {

	// Whether to compress the javascript with uglify.js
	// before starting the application
	compress  : false

	// Option of using uglify or closure-compiler for compression
	, compressionLib : 'uglify'
	
	// Output directory, relative to app.js
	, outputDir : './output'

	// Whether to allow custom items (like custom validations)
	// for non-js server side platforms
	, allowCustomItems : false

	// Stylesheet Output Directory
	, stylesheetDir : './public/stylesheets'

	// Javascript Output Directory
	, javascriptDir : './public/javascripts'

	// Directory for the formloader coffeescript
	, formloaderCoffee : './formloader/formloader.coffee'

	// Directory for the test coffeescript path
	, formloaderTestCoffee : './formloader/formloader-test.coffee'

	// Directory for the formloader style builder
	, formloaderCss : './formloader/styles.css'

	// Settings for the file that is generated by objectDump
	, dump : function(name) {
		return {
			prefix : "exports." + name + " = "
			, suffix : ';'
		};
	}

	// The default tags for the elements in the formloader
	, defaultTags : {
		
		'forms' : 'form'
		
		, 'fieldsets' : 'fieldset'

		, 'fields' : 'input'

		, 'buttons' : 'button'
	}
};