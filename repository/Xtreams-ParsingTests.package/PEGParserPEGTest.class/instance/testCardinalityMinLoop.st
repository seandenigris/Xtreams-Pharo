tests
testCardinalityMinLoop
	self rule: '.{2,"x"}' test: [ :p | 
		self parser: p shouldntMatch: 'xb'.
		self parser: p shouldntMatch: 'bx'.
		self parser: p shouldMatch: 2 charactersOf: 'bbxxbb'.
		self parser: p shouldMatch: 3 charactersOf: 'bbbxxbb' ]