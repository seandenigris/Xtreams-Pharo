tests
testCardinalityRangeMin
	self rule: '"x"{2}' test: [ :p | 
		self parser: p shouldntMatch: 'x'.
		self parser: p shouldMatch: 'xx'.
		self parser: p shouldMatch: 'xxx'. ]