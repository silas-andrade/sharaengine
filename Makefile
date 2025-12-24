# Makefile with common tasks
.PHONY: fmt lint docs test release

fmt:
	cargo fmt --all
lint:
	npm run format && npm run lint:md || true
	cargo clippy --all-targets --all-features -- -D warnings || true

docs:
	npm run format && cargo doc --no-deps --document-private-items --no-default-features

test:
	cargo test

release:
	# Create an annotated tag and push to trigger the release workflow
	@if [ -z "$(V)" ]; then echo "Usage: make release V=0.1.0"; exit 1; fi
	git tag -a v$(V) -m "release v$(V)"
	git push origin v$(V)

publish-docs:
	@echo "Build and prepare docs locally: cargo doc --no-deps && cp -r target/doc public/api && cp -r Documentation public/"
