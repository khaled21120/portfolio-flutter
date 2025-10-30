# Makefile for deploying Flutter web app to GitHub Pages

# CONFIG
BASE_HREF = '/'
GITHUB_REPO = git@github.com:khaled21120/khaled21120.github.io.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "🚀 Cleaning project..."
	flutter clean

	@echo "📦 Getting dependencies..."
	flutter pub get

	@echo "🌐 Building web release..."
	flutter build web --base-href $(BASE_HREF) --release

	@echo "🧱 Initializing temporary Git repo for deployment..."
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M gh-pages && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin gh-pages

	cd ../..
	@echo "✅ Deployed to GitHub Pages successfully!"

.PHONY: deploy-web
