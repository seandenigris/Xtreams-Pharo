tests
testCardinalityRange
	self rule: '"x"{2,4}' test: [ :p | 
		self parser: p shouldntMatch: 'x'.
		self parser: p shouldMatch: 'xx'.
		self parser: p shouldMatch: 'xxx'.
		self parser: p shouldMatch: 'xxxx'.
		self parser: p shouldntMatch: 'xxxxx'. ]