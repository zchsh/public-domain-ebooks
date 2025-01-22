# I'm new to makefiles, so starting with this
hello:
	echo "Hello world!"

# Demo file from 
pandoc_demo:
	pandoc ./markdown/test-book.md -o ./public/test-book.epub