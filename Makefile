.PHONY: doctor new list-templates

doctor:
	./scripts/doctor

new:
	@if [ -z "$(name)" ]; then echo "Usage: make new name=my-project template=scratch"; exit 2; fi
	./scripts/new-project "$(name)" "$(or $(template),scratch)"

list-templates:
	./scripts/new-project --list

