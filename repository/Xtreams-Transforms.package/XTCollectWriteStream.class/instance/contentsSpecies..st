initialize-release
contentsSpecies: aClass

	cache ifNotNil: [ cache recycle ].
	cache := aClass newRecycled: (
				(cache notNil and: [ cache size > 0 ])
					ifTrue: [cache size]
					ifFalse: [DefaultBufferSize])