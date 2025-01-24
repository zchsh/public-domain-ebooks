# Public Domain E-Books

This repository is meant as a place for me to experiment with e-book generation.

## Context

I recently received a Kobo as a gift. I also recently joined a book club.

Our book this month is [A Room of One's Own](https://en.wikipedia.org/wiki/A_Room_of_One's_Own), which also happens to have [entered the public domain on January 1, 2025](https://web.law.duke.edu/cspd/publicdomainday/2025/).

I tried grabbing an `.epub` from `archive.org`, and also checked Project Gutenberg, but I noticed a few little nit-picky things that didn't feel smooth and polished reading on my Kobo. So I figured it'd be worth doing a little investigation, and experimenting with generating `.epub` files from markdown. If I end up liking the workflow, maybe I can run with it and find public domain works that aren't yet in `.epub`, and see if I can contribute a little bit.

## Updates

### 2025-01-22 - tangent to get a black-and-white reduced size pdf

I downloaded a nice PDF of a 1935 edition of A Room of One's Own, but the file is 70 megabytes so I'm nervous to even try to load it onto my e-reader. I want a way to take a fancy full-colour PDF and covert it to black-and-white. Preferably with the option to tune the threshold, and dither effects would be nice to.

For context, my current understanding is that EPUB is more or less XHTML 1.1, but with some limited features, and very limited support for CSS. It seems like fonts can also be embedded. I find this kind of exciting, because it means I might be able to mess around with styling, and try to create an e-book edition of A Room of One's Own that roughly matches the 1935 edition.

Here are some starting points:

- Using `ghostscript` - <https://superuser.com/questions/200378/converting-a-pdf-to-black-white-with-ghostscript>
- Using `imagemagick` - <https://unix.stackexchange.com/questions/93959/how-to-convert-a-color-pdf-to-black-white>
- Using `imagemagick` - <https://github.com/ImageMagick/ImageMagick/discussions/2110>

### 2025-01-21 - diving in

I'm also sure I can use existing tooling for the `.md` to `.epub` conversion. I want to explore what [CommonMark spec](https://commonmark.org/) markdown syntax and features are fully supported. If it's all of them, that'll be great. I also want to explore how markdown syntax translates into the `.epub` format.

Selfishly, I do think it'd be kind of neat to experiment with a custom tool. Maybe it could be part of the [unified](https://unifiedjs.com/) ecosystem. Maybe there could be some [frontmatter](https://docs.github.com/en/contributing/writing-for-github-docs/using-yaml-frontmatter) in the markdown file, though I'm surprised at how frontmatter isn't as fully spec'd out and formalized as markdown. Yoink, [Pandoc already seems to support YAML frontmatter](https://pandoc.org/MANUAL.html#epubs).

[Pandoc](https://pandoc.org/installing.html) looks like a promising starting point.

## Standard eBooks

[Standard eBooks](https://standardebooks.org/) is a thing. Looks like basically what I'm thinking of doing, but with more rigid standards.

Website doesn't seem to work in Firefox, works in Google Chrome though.

They have a contribution guide at <https://standardebooks.org/contribute>, and a list of "Wanted eBooks" at <https://standardebooks.org/contribute/wanted-ebooks>.
  
One of the lead maintainers has a neat blog post from a while ago on DRM-free ebooks: <https://alexcabal.com/the-results-from-our-pay-what-you-want-ebook-pricing-experiment-are-in>.

Notably, _Standard eBooks_ pretty much always _excludes illustrations_. I feel like I kind of want to go in a bit of an opposite direction of a "standard" aesthetic... and instead, either try to re-create the oldest print edition I can find, or have fun with illustrations.

Side note: _20,000 Leagues Under the Seas_ doesn't seem to have an "acceptable public domain translation", according to <https://standardebooks.org/contribute/wanted-ebooks>. The original is in French.

Standard eBooks feels like maybe an opportunity for a POSSE-style approach. IE, make the version of the eBook that you want to make... and if Standard eBooks happens to not have that book yet, then you could re-format it to their specs and try to participate. Of course... I have _lots_ to learn about ebook formatting before I can even really consider that... Coincidentally though, Standard eBooks does _not_ yet have a version of Virginia Woolf's _A Room of One's Own_.

They also have a [Manual of Style](https://standardebooks.org/manual/1.8.1/single-page) that seems like it could be a _great_ place to start to further understand `.epub` without have to read through the very dry spec.

## Resources

- [EPUB on Wikipedia](https://en.wikipedia.org/wiki/EPUB)
- [EPUB version 3 Specification](https://www.w3.org/TR/epub-33/)
- [EPUB version 2 Specification](https://www.w3.org/TR/epub-33/)
- [EPUB 3 Structural Semantics](https://www.w3.org/TR/epub-ssv-11)

### Footnotes

EPUB footnotes are apparently a thing, which is great, cause _A Room of One's Own_ has some inline footnotes.

- <https://help.apple.com/itc/booksassetguide/en.lproj/itccf8ecf5c8.html>
- <https://pigsgourdsandwikis.blogspot.com/2012/05/creating-pop-up-footnotes-in-epub-3-and.html>
- <https://www.mobileread.com/forums/showthread.php?t=359042>

The TLDR seems to be:

```html
<!--Converting to single lines-->
<!--Inline-->
<p>This is some text that needs a footnote.<a href="FN_Section0001.xhtml#fn1" epub:type="noteref" id="bookfn1">[1]</a></p>

<!-- Footnote content -->
<body>
<aside epub:type="footnote" id="fn1">
  <p>This is the content of the footnote. <a href="9780061807145_Chapter_1_split_000.xhtml#bookfn1">↩</a></p>
</aside>
</body>
```

Note that CommonMark does _not_ support the usual footnote syntax, [as supported on GitHub](https://github.blog/changelog/2021-09-30-footnotes-now-supported-in-markdown-fields/) for example. Instead, it seems like raw HTML is the way to go, which is of course supported in CommonMark. The GitHub-style syntax does seem to have a significant limitation, which is that footnotes seem to have to be defined at the bottom of the document. Maybe the HTML way is better anyways, to let the epub properly reflect the author's intent in terms of where the footnote should appear.

### Building an epub file from scratch

As much as I'm interested in generating an `.epub` file straight from file types that are more familiar to me, like markdown, I think it'd be fun to get a little more acquainted with how `.epub` files actually work under the hood.

This seems like a good starting point... but it might be EPUB version 2?

- <https://thansen0.github.io/Building-an-epub-file/components.html>

There's an `.epub` validation tool, which seems like it'd be helpful:

- <https://www.bookery.app/epub_validation>

I'm pretty sure this validation tool is meant for EPUB version 3, which seems to be the current standard.

### Popular public-domain e-books

Neat to see this list from Project Gutenberg... there's definitely some overlap between what people seem to like reading, and what I might enjoy formatting and maybe even illustrating.

- <https://www.gutenberg.org/browse/scores/top>

Also neat to consider that every single year, new works enter the public domain in Canada... or at least they used to, there are **NO NEW PUBLIC DOMAIN WORKS IN CANADA UNTIL 2043**, which means we _just_ missed the chance to have The Lord of the Rings in the public domain:

- <https://www.cbc.ca/news/entertainment/canada-public-domain-pause-1.6706498>
- <https://gutenberg.ca/index.html>

Of course, there's still a hefty amount of neat stuff already in the public domain. And, copyright expiration isn't the only way that works enter the public domain... people also sometimes choose to put them there!

- <https://en.wikipedia.org/wiki/Category:Public_domain_books>
