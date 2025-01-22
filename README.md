# Public Domain E-Books

This repository is meant as a place for me to experiment with e-book generation.

## Context

I recently received a Kobo as a gift. I also recently joined a book club.

Our book this month is [A Room of One's Own](https://en.wikipedia.org/wiki/A_Room_of_One's_Own), which also happens to have [entered the public domain on January 1, 2025](https://web.law.duke.edu/cspd/publicdomainday/2025/).

I tried grabbing an `.epub` from `archive.org`, and also checked Project Gutenberg, but I noticed a few little nit-picky things that didn't feel smooth and polished reading on my Kobo. So I figured it'd be worth doing a little investigation, and experimenting with generating `.epub` files from markdown. If I end up liking the workflow, maybe I can run with it and find public domain works that aren't yet in `.epub`, and see if I can contribute a little bit.

## Updates

### 2025-01-22 - tangent to get a black-and-white reduced size pdf

I downloaded a nice PDF of a 1935 edition of A Room of One's Own, but the file is 70 megabytes so I'm nervous to even try to load it onto my e-reader. I want a way to take a fancy full-colour PDF and covert it to black-and-white. Preferably with the option to tune the threshold, and dither effects would be nice to.

Here are some starting points:

- Using `ghostscript` - <https://superuser.com/questions/200378/converting-a-pdf-to-black-white-with-ghostscript>
- Using `imagemagick` - <https://unix.stackexchange.com/questions/93959/how-to-convert-a-color-pdf-to-black-white>
- Using `imagemagick` - <https://github.com/ImageMagick/ImageMagick/discussions/2110>

### 2025-01-21 - diving in

I'm also sure I can use existing tooling for the `.md` to `.epub` conversion. I want to explore what [CommonMark spec](https://commonmark.org/) markdown syntax and features are fully supported. If it's all of them, that'll be great. I also want to explore how markdown syntax translates into the `.epub` format.

Selfishly, I do think it'd be kind of neat to experiment with a custom tool. Maybe it could be part of the [unified](https://unifiedjs.com/) ecosystem. Maybe there could be some [frontmatter](https://docs.github.com/en/contributing/writing-for-github-docs/using-yaml-frontmatter) in the markdown file, though I'm surprised at how frontmatter isn't as fully spec'd out and formalized as markdown. Yoink, [Pandoc already seems to support YAML frontmatter](https://pandoc.org/MANUAL.html#epubs).

[Pandoc](https://pandoc.org/installing.html) looks like a promising starting point.

## Resources

- [EPUB on Wikipedia](https://en.wikipedia.org/wiki/EPUB)
- [EPUB version 3 Specification](https://www.w3.org/TR/epub-33/)
- [EPUB version 2 Specification](https://www.w3.org/TR/epub-33/)
