*Xtreams-TransformsTests-transforming
testReadTransforming2into1
	| result |
	self output write: #[ 1 2 3 4 ].
	result :=
		(self input transforming: [:in :out | in get. out put: in get])
			read: 2.
	self assert: result = #[ 2 4 ]