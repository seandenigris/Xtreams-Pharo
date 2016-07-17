tests
testHex
	self assert: (parser validate: 'Escape' stream: '\x00001F' reading).
	self assert: (parser validate: 'Escape' stream: '\x1F' reading)