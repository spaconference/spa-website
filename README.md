# SPA website

This is the jekyll project for programme chairs to produce most of the pages associated with the [SPA conference](http://spaconference.org) website.

There are some pages that cannot be edited from here:

 - The programme. This is worked on by the organisers privately and published via a different route when ready.
 - Previous conferences, which are left in situ once the year changes. There is a backup of them in the [SPA conference organisation](https://github.com/spaconference/previous-spa-sites).
 - Scripts under MySpa. The PHP functionality of the site is in another (currently private) repo.

To run locally: `bundle exec jekyll serve`. The output of that command will tell you where the site is running locally (something like `localhost:4000/$conference_year/`).

## If you want to add a page

Some of the common pages are already present in this repo but excluded from the build and the menu. If you want to use one of those pages:

- update the page
- comment it out in the exclusions section in [_config.yml](_config.yml).
- if it appears in the menu, comment it in in [_includes/menu.html](_includes/menu.html)

The [book now](book-now.md) page can be added as a button above the menu; the code to do this is commented out in [_includes/header.html](_includes/header.html).

If you want to add a brand new page, you just need to add it, and add it to the menu if appropriate.

## If a page is no longer needed

When a page has passed its time, DO NOT REMOVE IT, but comment it out in the menu if it appears. For example, the lead a session page will no longer be used after the CFP has closed, but should not become a 404; instead, update it to say the CFP has closed and remove it from the menu.
