*Xtreams-Email
grammarApp

	^'addrspec       <-   localpart "@" domain
localpart      <-   dotatom / quotedstring /* obs-local-part */
domain          <-   dotatom / domainliteral /* obs-domain */
domainliteral  <-   [CFWS] "[" *([FWS] dtext) [FWS] "]" [CFWS]
dtext           <- [\x000021-\x000050] /		/* Printable US-ASCII */
										[\x000054-\x00007E]	 /* characters not including */
										/* / obs-dtext          ;  "[", "]", or "\" */
	
/* rfc5234 B.1 */
ALPHA          <-  [\x000041-\x00005A] / [\x000061-\x00007A]
DIGIT          <-  [\x000030-\x000039]
HTAB           <-  \x000009 /* horizontal tab */
SP             <-  \x000020
WSP            <-  SP / HTAB

/* 3.2.2. Folding White Space and Comments */
FWS             <-   ([*WSP CRLF] 1*WSP) 
/* obs-FWS */
   ctext           <-   [\x000021-\x000027] /
                       [\x00002A-\x00005B] /
                       [\x00005D-\x00007E]

   ccontent        <-   ctext / quotedpair / comment

   comment         <-   "(" *([FWS] ccontent) [FWS] ")"

   CFWS            <-   (1*([FWS] comment) [FWS]) / FWS
/* 3.2.1.  Quoted characters */
   quotedpair     <-   ("\" (VCHAR / WSP)) /* / obs-qp */
/* 3.2.3.  Atom */
atext           <-   ALPHA / DIGIT /
                       "!" / "#" /
                       "$" / "%" /
                       "&" / "''" /
                       "*" / "+" /
                       "-" / "/" /
                       "=" / "?" /
                       "^" / "_" /
                       "`" / "{" /
                       "|" / "}" /
                       "~"

   atom            <-   [CFWS] 1*atext [CFWS]

   dotatomtext   <-   1*atext *("." 1*atext)

   dotatom        <-   [CFWS] dotatomtext [CFWS]

/* 3.2.4.  Quoted Strings */
qtext           <-   \x000021 /							/* Printable US-ASCII */
                     [\x000023-\x00005B] /	/* characters not including */
                     [\x00005D-\x00007E] 		/* "\" or the quote character */
                       /* obs-qtext */
qcontent        <-   qtext / quotedpair
quotedstring   <-   [CFWS] DQUOTE *([FWS] qcontent) [FWS] DQUOTE [CFWS]'