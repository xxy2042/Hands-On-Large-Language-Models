# This is a global variable, like a private note for make.
GLOBAL_VAR = "I am known only to make"

# This is an exported variable, like a public notice for everyone.
export EXPORTED_VAR = "I am known to make AND the shell"

test:
	@echo "--- Testing GLOBAL_VAR ---"
	# Make sees its private note and substitutes it into the command.
	# The command given to the shell is literally: echo "I am known only to make"
	@echo "  Using make syntax (\$$()): $(GLOBAL_VAR)"

	# Now we ask the shell to find the variable in its own environment.
	# The shell can't see make's private notes, so this will be empty.
	@echo "  Using shell syntax (\$$): $$GLOBAL_VAR"

	@echo
	@echo "--- Testing EXPORTED_VAR ---"
	# Make sees this variable too and can substitute it.
	@echo "  Using make syntax (\$$()): $(EXPORTED_VAR)"

	# We ask the shell to find the variable in its environment.
	# Because it was exported, it's there. The shell can see it.
	@echo "  Using shell syntax (\$$): $$EXPORTED_VAR"