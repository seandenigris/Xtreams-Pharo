testing
testBlockExpression

	<timeout: 10 "seconds">
	| expression tree |
	expression := '[super ++ (anInteger - skipped)] on: Incomplete do: [ :ex | ex pass ]'.
	tree := parser parse: 'Expression' stream: expression reading actor: PEGTreeBuilder new.
	self assert: tree key value size equals: expression size