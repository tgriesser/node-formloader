
{{= c.press.raw('raw/json2.js', 'raw/jquery.js', 'raw/underscore.js'
  , 'raw/backbone.js', 'raw/select2.js', 'raw/bootstrap-dropdown.js', 'raw/bootstrap-modal.js', 'raw/jgrowl.js'
  , '../node_modules/checkit/lib/checkit.js', '../node_modules/buildit/lib/buildit.js', 'raw/jqUI.js') }}

Forms = {}

`{{= c.press.replace('../output/sample.js', ['exports.', 'Forms.']) }}`

SampleBase = BuildIt.init(Forms.sample);
form   = new SampleBase('forms', 'login');

$("#formloader-test").html(form.render());