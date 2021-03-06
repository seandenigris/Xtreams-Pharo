accessing - reading
read: anInteger into: aSequenceableCollection at: startIndex
	| count |
	count := anInteger min: (dataLength - readPosition).
	aSequenceableCollection replaceFrom: startIndex to: startIndex + count - 1 with: cache startingAt: readPosition + 1.
	readPosition := readPosition + count.
	count < anInteger ifTrue: [(Incomplete on: aSequenceableCollection count: count at: startIndex) raise].
	^anInteger