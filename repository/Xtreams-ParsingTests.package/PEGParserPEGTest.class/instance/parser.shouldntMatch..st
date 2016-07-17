as yet unclassified
parser: aPEGParser shouldntMatch: aString
	| inputStream |
	inputStream := aString reading.
	self deny: ((aPEGParser validate: 'TESTRULE' stream: inputStream) and: [ inputStream atEnd ])