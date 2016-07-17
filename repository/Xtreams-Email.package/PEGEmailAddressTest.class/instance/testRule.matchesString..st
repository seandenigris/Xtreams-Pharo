testing
testRule: ruleName matchesString: aString
	| result flatResult |
	result := parser parse: ruleName stream: aString reading actor: nil.
	result isNil should beFalse.
	flatResult := result deepFlatten reject: #isNil.
	flatResult size should equal: aString size