Use dot notation to flatten nested objects.

```javascript
var flattenHash = require('flatten-hash');
var nested = {foo: {bar: {baz: {bang: 'fez'} } }, a: 'b'};
console.log(var flat=flattenHash(nested));
```

flattens to:

```javascript
{ 'foo.bar.baz.bang' : 'fez', a:'b'}
```

which you can then refer to as

```javascript
console.log(flat['foo.bar.baz.bang']);
```

### Limitations
Currently does not work with `Array`s and `RegExp` objects; will throw an error.

### See also

[expand-hash](https://github.com/doowb/expand-hash) - Expand hash keys into an object with the given values.
