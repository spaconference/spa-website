# SPA website [![Travis build status](https://api.travis-ci.org/spaconference/spa-website.svg?branch=master)](https://travis-ci.org/spaconference/spa-website)

Produce the static pages for the website of [SPA: Software in Practice](http://spaconference.org).

The non-static parts of the site are:

 - The programme. This is worked on by the organisers privately and published via a different route when ready.
 - Scripts under MySpa. The PHP functionality of the site is in another (currently private) repo.

In addition, previous conference sites are left in situ once the year changes. There is a back up of them in the [SPA conference organisation](https://github.com/spaconference/previous-spa-sites) or they can be seen from the [current SPA site](http://spaconference.org).

# To run locally

You will need [jekyll](https://jekyllrb.com/docs/quickstart/) to run the site locally, and [html-proofer](https://rubygems.org/gems/html-proofer/) to run the tests locally.

To run the site locally:

```
bundle exec jekyll serve --watch
```

The `--watch` means that you will not have to restart the server to see changes reflected on your locally running site. However, you always need to restart if you make changes to `_config.yml`.

The output of this command will tell you where the site is running locally. It will be something like `localhost:4000/$base_url/` (note the closing slash).

`$base_url` is whatever is set as the `baseurl` in [_config.yml](_config.yml).

To run the tests locally:

```
bundle exec htmlproofer --assume-extension --url-swap $base_url: ./_site
```

where `$base_url` is as above, the `baseurl` in [_config.yml](_config.yml).

## To update the site

Do not commit to master. Raise a pull request with your changes and then merge to master when ready. [Travis](https://travis-ci.org/spaconference/spa-website) will run html-proofer on pull requests to confirm that all links exist. You can merge your own pull requests.

Merging to master will deploy your changes to the live site.

## If you want to add a page

Some of the common pages are already present in this repo but excluded from the build and the menu. If you want to use one of those pages:

- update the page
- comment it out in the exclusions section in [_config.yml](_config.yml).
- if it appears in the menu, comment it in in [_includes/menu.html](_includes/menu.html)

The [book now](book-now.md) page can be added as a button above the menu; the code to do this is commented out in [_includes/header.html](_includes/header.html).

If you want to add a brand new page, you just need to add it, and add it to the menu if appropriate.

## How to handle internal navigation

The Lead a session pages have internal navigation. Follow the pattern in [_includes/lead-a-session-nav.html](_includes/lead-a-session-nav.html) to add or remove pages from the internal navigation. Make sure new pages have `has-nav: lead-a-session` in the yaml front matter. (See for example [lead-a-session.md](/lead-a-session.md).)

## If a page is no longer needed

When a page has passed its time, DO NOT REMOVE IT, but comment it out in the menu if it appears. For example, the lead a session page will no longer be used after the CFP has closed, but should not become a 404; instead, update it to say the CFP has closed and remove it from the menu.
