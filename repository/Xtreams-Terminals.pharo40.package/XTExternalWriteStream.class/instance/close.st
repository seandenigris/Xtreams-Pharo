initialize-release
close
	destination closed ifTrue: [^self].
	destination streamingWriteClose