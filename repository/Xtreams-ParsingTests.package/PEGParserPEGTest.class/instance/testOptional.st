tests
testOptional
	self rule: '"x"? "b"' test: [ :p | 
		self parser: p shouldMatch: 'b'.
		self parser: p shouldMatch: 'xb'. ]