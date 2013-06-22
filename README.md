[![Build Status](https://travis-ci.org/leonardoeloy/unitopus.png?branch=master)](https://travis-ci.org/leonardoeloy/unitopus)

# Unitopus #

> Static blog generator that doesn't sucks.

or maybe:

> Static blog generator with seven legs off of complexity.

or even better:

> Unitopus brings the simplicity that no bi-polar man or any eight legged sea creature would!

This is obviously a joke. Jekyll, Hyde, and Octopress are way more feature complete. :)

## Getting Started ##

1. Create a Markdown file with your blog post, using these metadata fields:

		$ mkdir blog
		$ cd blog
		$ echo > first-post.md<<EOF
			Author: Your Name
			Categories: Lifestyle, Programming
			Published: true

			# Title of my Post #

			> "Quote quote quote" -- Person, Famous

			Lorem ipsum?
		 EOF
			

2. Generate your static pages:

		$ unitopus generate

3. Take a look on the results:

		$ unitopus browse

4. Publish the `site` folder into your GitHub Pages account:

		$ cd site
		$ git init
		$ git add .
		$ git commit -m "first commit"
		$ git remote add origin git@github.com:<username>/<username>.github.io.git
		$ git push -u origin master

There you go, no more hassles.

## Creating pages ##

1. Go to the `blog` directory again, and create a new directory:

		$ mkdir about

2. Create a Markdown file called `index.md`:

		$ echo > about/index.md<<EOF
			# Yay Markdown! #
		  EOF

3. Generate you static pages:

		$ unitopus generate

4. Commit your changes

		$ cd site
		$ git commit -am "new pages"
		$ git push -u origin master

### Links within pages ###

All links must be relative. For example:

**about/index.md**

		Link to [another file in the same directory](other-page.html)

**other-page.md**

		My other Markdown page.

This also applies to link to blog pages:

**blog-post.md**

		This is a blog post.

**about/index.md**

		Link to my [blog post](../blog-post.html)

## More about blog ##

These fields aren't required, but they're expected to be the first lines in your Markdown file. They aren't case-sensitive and will be redacted from the resulting HTML file.

* Author: Your Name
	* No default value
* Category: Separate using comma `,`
	* No default value
* Published: `true` or `false`
	* Defaults to `true`
* Date: `YYYY-MM-DD`
	* Defaults to the file update date
	* If date is current, Unitopus will use `Published` to determine whether to generate it or not
	* If date is in the future, Unitopus will skip this file

## Themes ##

Unitopus uses Bootstrap. To customize, make Unitopus copy the default theme to your directory:

		$ unitopus unpack theme

This will create a `.unitopus` directory with the following structure:

* .unitopus/theme/
	* .version 
	* css/
	* js/
	* img/
	* index.html
	* post.html
	* page.html

Customize the HTML pages using Mustache.

## Support ##

Open an issue and we'll figure things out.

## About the Author ##

[http://leonardoeloy.com/about](http://leonardoeloy.com/about)

## License ##

Copyright (c) 2013, Leonardo Eloy

Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted, provided that the above copyright notice and this permission notice appear in all copies.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
