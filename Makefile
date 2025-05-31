
TAILWIND_INPUT=./assets/css/_tailwind.app.css
TAILWIND_OUTPUT=./assets/css/styles.css

.PHONY: dev tailwind jekyll build


dev:
	@echo "Starting Tailwind CSS and Jekyll server..."
	@$(MAKE) jekyll-serve & $(MAKE) tailwind-watch
	@wait

tailwind:
	bundle exec tailwindcss -i $(TAILWIND_INPUT) -o $(TAILWIND_OUTPUT) --watch

serve:
	bundle exec jekyll serve --livereload

build:
	@echo "Building Tailwind CSS and Jekyll site for production..."
	bundle exec tailwindcss -i $(TAILWIND_INPUT) -o $(TAILWIND_OUTPUT) --minify
	JEKYLL_ENV=production bundle exec jekyll build