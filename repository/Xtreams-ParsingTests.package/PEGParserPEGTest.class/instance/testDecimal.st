tests
testDecimal
	self assert: (parser validate: 'Escape' stream: '\d1000000' reading).
	self assert: (parser validate: 'Escape' stream: '\d1' reading)