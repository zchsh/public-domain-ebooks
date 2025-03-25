# I'm new to makefiles, so starting with this
hello:
	echo "Hello world!"
	echo "This is a make command."

# Demo file from pandoc docs
pandoc_demo:
	pandoc ./markdown/test-md-pandoc.md -o ./public/test-md-pandoc.epub

# Convert a full-color large file image PDF to black-and-white
convert_pdf_to_bw:
	magick -monitor -density 300 ~/Desktop/2025-01-21-a-room-of-ones-own-pdf-from-archive-dot-org.pdf -alpha off -colorspace gray -threshold 50% -quality 100% -compress zip ~/Desktop/2025-01-22-a-room-of-ones-own-1935-edition.pdf

# Zip up the custom ebook contents, which is all an epub is
epub_custom:
	rm -f ./public/test-custom.epub; \
	cd ./custom/test-custom; \
	zip -rX ../../public/test-custom.epub mimetype META-INF CONTENTS -x "*.DS_Store";

# Zip up the A Room Of One's Own ebook contents
epub_arooo:
	rm -f ./public/test-room-of-ones-own.epub; \
	cd ./custom/test-room-of-ones-own; \
	zip -rX ../../public/a-room-of-ones-own.epub mimetype META-INF CONTENTS -x "*.DS_Store"
	cp -R '/Users/zachshilton/code/public-domain-ebooks/public/a-room-of-ones-own.epub' '/Volumes/KOBOeReader/A Room of Ones Own.epub'
	
	