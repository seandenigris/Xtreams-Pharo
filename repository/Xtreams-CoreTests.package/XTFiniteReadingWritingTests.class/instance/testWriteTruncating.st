tests - core
testWriteTruncating

	self output positioning
		write: #[1 2 3 4 5 6];
		-- 3;
		write: #[1 2];
		close.
	self assert: self input rest = #[1 2 3 1 2].