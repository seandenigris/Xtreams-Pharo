*Xtreams-Email
grammarEmailAddress

	^'/* Extracted from https://tools.ietf.org/html/rfc5322
	The ABNF (https://tools.ietf.org/html/rfc5234) used in the standard was adapted to Xtreams grammar, i.e.:
		- Repetition was made postfix and converted to {} style
		- Optional was changed from [] -> postfix ?
		- Backslashes were escaped
		- Number Literals escape char from % to \
		- Literal ranges were slightly modified (escape added to range max as well as min) */
	
	/* 3.2.1.  Quoted characters */
	quoted-pair     =   ("\\" (VCHAR / WSP)) / obs-qp
	
	/* 3.2.2. Folding White Space and Comments */
	FWS		=   ((WSP* CRLF)? WSP{1}) / obs-FWS /* Folding white space */
	ctext	=   [\d33-\d39] / /* Printable US-ASCII */
						[\d42-\d91] / /* characters not including */
						[\d93-\d126] / /* "(", ")", or "\\" */
						obs-ctext
	ccontent        =   ctext / quoted-pair / comment
	comment         =   "(" (FWS? ccontent)* FWS? ")"
	CFWS            =   ((FWS? comment){1} FWS?) / FWS
	
	/* 3.2.3.  Atom */
	atext = ALPHA / DIGIT / /* Printable US-ASCII */
					"!" / "#" /     /* characters not including */
					"$" / "%" /     /* specials.  Used for atoms. */
					"&" / "''" /
					"*" / "+" /
					"-" / "/" /
					"=" / "?" /
					"^" / "_" /
					"`" / "{" /
					"|" / "}" /
					"~"
	atom            =   CFWS? atext{1} CFWS?
	dot-atom-text   =   atext{1} ("." atext{1})*
	dot-atom        =   CFWS? dot-atom-text CFWS?
	specials        =   "(" / ")" / /* Special characters that do */
											 "<" / ">" / /* not appear in atext */
											 "[" / "]" /
											 ":" / ";" /
											 "@" / "\\" /
											 "," / "." /
											 DQUOTE
	
											
	/* 3.2.4.  Quoted Strings */
	qtext           =		"\d33" /	/* Printable US-ASCII */
  										[\d35-\d91] / /* characters not including */
											[\d93-\d126] / /* "\\" or the quote character */
											obs-qtext
	qcontent        =   qtext / quoted-pair
	quoted-string   =   	CFWS? DQUOTE (FWS? qcontent)* FWS? DQUOTE CFWS?
	
	/* 3.2.5.  Miscellaneous Tokens */
	word            =   atom / quoted-string
	phrase          =   word{1} / obs-phrase
	unstructured    =   ((FWS? VCHAR)* WSP*) / obs-unstruct
	
	/* 3.4.  Address Specification */
	address         =   mailbox / group
	mailbox         =   name-addr / addr-spec
	name-addr       =   display-name? angle-addr
	angle-addr      =   CFWS? "<" addr-spec ">" CFWS? / obs-angle-addr
	group           =   display-name ":" group-list? ";" CFWS?
	display-name    =   phrase
	mailbox-list    =   (mailbox ("," mailbox)*) / obs-mbox-list
	address-list    =   (address ("," address)*) / obs-addr-list
	group-list      =   mailbox-list / CFWS / obs-group-list
	
	/* 3.4.1.  Addr-Spec Specification */
	
   addr-spec       =   local-part "@" domain

   local-part      =   dot-atom / quoted-string / obs-local-part

   domain          =   dot-atom / domain-literal / obs-domain

   domain-literal  =   CFWS? "[" (FWS? dtext)* FWS? "]" CFWS?

   dtext           =   [\d33-\d90] /
                       [\d94-\d126] /
                       obs-dtext

	/* 3.5.  Overall Message Syntax

  message         =   (fields / obs-fields)
                       (CRLF body)?

   body            =   (*(*998text CRLF) *998text) / obs-body */

   text    =   [\d1-\d9] / /* Characters excluding CR */
               "\d11" /    /*  and LF */
               "\d12" /
               [\d14-\d127]

	/* 4.1.  Miscellaneous Obsolete Tokens */
	obs-NO-WS-CTL   =   [\d1-\d8] / "\d11" / "\d12" / [\d14-\d31] / "\d127"

   obs-ctext       =   obs-NO-WS-CTL

   obs-qtext       =   obs-NO-WS-CTL

   obs-utext       =   "\d0" / obs-NO-WS-CTL / VCHAR

   obs-qp          =   "\\" ("\d0" / obs-NO-WS-CTL / LF / CR)

   obs-body        =   ((LF* CR* (("\d0" / text) LF* CR*)*) / CRLF)*

   obs-unstruct    =   ((LF* CR* (obs-utext LF* CR*)*) / FWS)*
	 obs-phrase      =   word (word / "." / CFWS)*

   obs-phrase-list =   (phrase / CFWS)? ("," (phrase / CFWS)?)*

	/* 4.2.  Obsolete Folding White Space */
	obs-FWS         =   WSP{1} (CRLF WSP{1})*
	
	/* 4.4.  Obsolete Addressing */
	obs-angle-addr  =   CFWS? "<" obs-route addr-spec ">" CFWS?
	obs-route       =   obs-domain-list ":"
	obs-domain-list =   (CFWS / ",")* "@" domain ("," CFWS? ("@" domain)?)*
	obs-mbox-list   =   (CFWS? ",")* mailbox ("," [mailbox / CFWS])*
	obs-addr-list   =   ([CFWS] ",")* address ("," (address / CFWS)?)*

   obs-group-list  =   (CFWS? ","){1} CFWS?

   obs-local-part  =   word ("." word)*

   obs-domain      =   atom ("." atom)*

   obs-dtext       =   obs-NO-WS-CTL / quoted-pair

	/* rfc5234 B.1 https://tools.ietf.org/html/rfc5234 */
	ALPHA          <-  [\x000041-\x00005A] / [\x000061-\x00007A] /* A-Z / a-z */
	BIT            <-  "0" / "1"
	CHAR           <-  [\x000001-\x00007F] /* any 7-bit US-ASCII character, excluding NUL */
	CR             <-  "\x00000D" /* carriage return */
	CRLF           <-  CR LF /* Internet standard newline */
	CTL            <-  [\x000000-\x00001F] / "\x00007F" /* controls */
	DIGIT          <-  [\x000030-\x000039] /* 0-9 */
	DQUOTE         <-  "\x000022" /* " (Double Quote) */
	HEXDIG         <-  DIGIT / "A" / "B" / "C" / "D" / "E" / "F"
	HTAB           <-  "\x000009" /* horizontal tab */
	LF             =  "\x00000A" /* linefeed */
	LWSP           <-  (WSP / CRLF WSP)* /* Use of this linear-white-space rule permits lines containing only white space that are no longer legal in mail headers and have caused interoperability problems in other contexts. Do not use when defining mail headers and use with caution in other contexts. */
	OCTET          <-  [\x000000-\x0000FF] /* 8 bits of data */
	SP             <-  "\x20"
	WSP            <-  SP / HTAB /* white space */
	VCHAR          =  [\x21-\x7E] /* visible (printing) characters */'