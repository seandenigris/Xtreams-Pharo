as yet unclassified
parser: aPEGParser shouldMatch: aString
	| inputStream |
	inputStream := aString reading.
	self assert: (aPEGParser validate: 'TESTRULE' stream: inputStream).
	self assert: inputStream atEnd