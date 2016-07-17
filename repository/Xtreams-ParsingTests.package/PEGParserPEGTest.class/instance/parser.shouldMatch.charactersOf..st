as yet unclassified
parser: aPEGParser shouldMatch: number charactersOf: aStream
	| matchedChars |
	matchedChars := aPEGParser parse: 'TESTRULE' stream: aStream actor: nil.
	self assert: matchedChars size = number