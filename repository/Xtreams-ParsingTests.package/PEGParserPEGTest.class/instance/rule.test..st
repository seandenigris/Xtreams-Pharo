tests
rule: aString test: aBlock
	| ruleParser |
	ruleParser := parser parse: 'Grammar' stream: 'TESTRULE <- ', aString actor: PEGParserParser new.
	aBlock value: ruleParser
	