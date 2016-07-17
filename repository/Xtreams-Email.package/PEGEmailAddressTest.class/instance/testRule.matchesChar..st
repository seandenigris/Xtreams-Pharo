testing
testRule: ruleName matchesChar: aCharacter
	| result |
	result := parser parse: ruleName stream: aCharacter asString reading actor: nil.
	result asString should equal: aCharacter asString