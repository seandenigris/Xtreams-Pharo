tests
testClear

	buffer write: 4 from: '1234' at: 1.
	buffer clear.
	self assert: buffer cacheSize = 0.
	self assert: buffer readPosition = 0.
	self assert: buffer readSize = 0.
	self assert: buffer writePosition = 0.
	self assert: buffer writeSize = 0