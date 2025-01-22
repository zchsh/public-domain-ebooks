# I'm new to makefiles, so starting with this
hello:
	echo "Hello world!"

# Demo file from pandoc docs
pandoc_demo:
	pandoc ./markdown/test-book.md -o ./public/test-book.epub

# Convert a full-color large file image PDF to black-and-white
convert_pdf_to_bw:
	magick -monitor -density 300 ~/Desktop/2025-01-21-a-room-of-ones-own-pdf-from-archive-dot-org.pdf -alpha off -colorspace gray -threshold 50% -quality 100% -compress zip ~/Desktop/2025-01-22-a-room-of-ones-own-1935-edition.pdf