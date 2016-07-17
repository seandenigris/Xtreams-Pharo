tests
testCardinalityLoop
	self rule: '.{"x"}' test: [ :p | 
		self parser: p shouldMatch: 2 charactersOf: 'bbxxbb' ]