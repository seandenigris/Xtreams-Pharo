seeking
++ anInteger
	| skipped |
	anInteger < 0 ifTrue: [ ^self -- anInteger negated ].
	skipped := buffer writeSkip: anInteger.
	skipped = anInteger ifTrue: [^anInteger].
	[destination ++ (anInteger - skipped)] on: Incomplete do: [:incomplete |
		(Incomplete count: incomplete count + skipped) raise].
	^anInteger