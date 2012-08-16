var I18N = {};
I18N.translateTo = function (lang) {
	var translatables = $('[lang]');
	translatables.hide();
	translatables.filter('[lang=' + lang + ']').show();
	translatables.filter('[lang=]').show();
	this.savePreference(lang);
};

I18N.savePreference = function (lang) {
	if (window.localStorage != undefined) {
		window.localStorage.lang = lang;
	}
};

I18N.getPreference = function () {
	var lang = null;
	if (window.localStorage != undefined) {
		lang = window.localStorage.lang;
	}

	if (lang) {
		return lang;
	} else {
		return "en_CA";
	}

};
