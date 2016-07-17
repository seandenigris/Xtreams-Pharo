testing
testRule: ruleName matchesString: aString
	| result |
	result := parser parse: ruleName stream: aString reading actor: nil.
	result should equal: aString asArray