accessing
get
	| object |
	substreamAtEnd ifTrue: [Incomplete zero raise].
	object := [source get] on: Incomplete do: [:incomplete | sourceAtEnd := substreamAtEnd := true. incomplete pass].
	(substreamAtEnd := test value: object) ifTrue:
		[inclusive ifTrue: [^object].
		Incomplete zero raise].
	^object