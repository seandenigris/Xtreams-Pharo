testing
testDIGIT
	1 to: 9 do: [ :digit |
		| result |
		result := parser parse: 'DIGIT' stream: digit asString reading actor: nil.
		result asString should equal: digit asString ]