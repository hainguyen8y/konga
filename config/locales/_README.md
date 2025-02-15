# Internationalization / Localization Settings

> Also see the [official docs](http://links.sailsjs.org/docs/config/locales) on internationalization/localization:

## Locales

All locale files live under `config/locales`. Here is where you can add translations
as JSON key-value pairs. The name of the file should match the language that you are supporting, which allows for automatic language detection based on request headers.

Here is an example locale stringfile for the Spanish language (`config/locales/es.json`):

```json
{
  "Hello!": "Hola!",
  "Hello %s, how are you today?": "¿Hola %s, como estas?",
}
```

## Usage

Locales can be accessed in controllers/policies through `res.i18n()`, or in views through the `__(key)` or `i18n(key)` functions.
Remember that the keys are case sensitive and require exact key matches, e.g.

```ejs
<h1> <%= __('Welcome to PencilPals!') %> </h1>
<h2> <%= i18n('Hello %s, how are you today?', 'Pencil Maven') %> </h2>
<p> <%= i18n('That\'s right-- you can use either i18n() or __()') %> </p>
```

## Configuration

Localization/internationalization config can be found in `config/i18n.js`, from where you can set your supported locales.
