# I'm new to makefiles, so starting with this
hello:
	echo "Hello world!"

# Demo file from 
pandoc_demo:
	pandoc ./markdown/2025-01-21-pandoc-test-book.md -o ./public/2025-01-21-pandoc-test-book.epub