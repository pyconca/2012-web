Handlebars.registerHelper('nl2br', function(text) {
    var lines = (text + '').split(/\r\n|\r|\n/);
    var new_string = "";
    for (var i = 0; i < lines.length; i++) {
        if (i) {
            new_string += "<br>";
        }
        new_string += Handlebars.Utils.escapeExpression(lines[i]);
    }
    return new Handlebars.SafeString(new_string);
});


Handlebars.registerHelper('if_eq', function(context, options) {
    if (context == options.hash.compare) return options.fn(this);
  return options.inverse(this);
});


Handlebars.registerHelper('selected', function(option, value) {
    if (option == value) {
        return new Handlebars.SafeString(' selected');
    } else {
        return '';
    }
 });
