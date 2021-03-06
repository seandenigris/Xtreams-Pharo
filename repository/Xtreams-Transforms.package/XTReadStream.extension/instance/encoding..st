*Xtreams-Transforms-transforming
encoding: anEncoding
	"Transform bytes into characters using @anEncoding such as #utf8 or #ascii, etc. Any encoding supported by StreamEncoder is allowed.
	The encoding steam also performs automatic line end conversion from arbitrary platform convention to CRs, unless set into a transparent mode"
	"	anEncoding	<Symbol> encoding identifier recognized by StreamEncoder class>>new:
		^<EncodedReadStream>
	""
		((65 to: 90) reading encoding: #ascii) rest
	""
		| crlf text |
		crlf := String with: Character cr with: Character lf.
		text := ('Hello', crlf, 'World') asByteArrayEncoding: #ascii.
		(text reading encoding: #ascii) rest.
		(text reading encoding: #ascii) setLineEndTransparent; rest
	"
	^XTEncodeReadStream on: self encoding: anEncoding