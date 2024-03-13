# SPA Website

**Note:** _For [SPA2021](https://spaconference.org/spa2021) this repo was not used to generate the SPA website and we hosted SPA2021 on Wix, however a static version of that site is still archived [here](https://github.com/spaconference/previous-spa-sites/tree/master/spa2021). For [SPA2022](https://spaconference.org/spa2023) we used a simple static site which is archived [here](https://github.com/spaconference/previous-spa-sites/tree/master/spa2022).  The code in this repo could be used again for a future SPA conference if a more complex site is needed._

The code in this repo exists to produce the static pages for the website of [SPA: Software in Practice](https://spaconference.org).

The non-static parts of the site are:

 - The programme. This is worked on by the organisers privately and published via a different route when ready.
 - Scripts under MySpa. The PHP functionality of the site is in another (currently private) repo.

In addition, previous conference sites are left in situ once the year changes. There is a back up of them in the [SPA conference organisation](https://github.com/spaconference/previous-spa-sites) or they can be seen from the [current SPA site](https://spaconference.org).

# To run locally

You will need [jekyll](https://jekyllrb.com/docs/quickstart/) to run the site locally, and [html-proofer](https://rubygems.org/gems/html-proofer/) to run the tests locally.  These tools are Ruby based and need Ruby 2.2 - 2.6, version 2.7 and version 3.0 do not work with html-proofer as of March 2021.

To just "build" the site with Jekyll and run the html-proofer process:

```
# adjust argument for year of site being worked on - this is used to
# adjust URLs and so if it isn't correct then the html-proofer will 
# fail
./scripts/build.sh /spa2020
```

To run the site locally:

```
./scripts/serve-local.sh
```

And then open http://localhost:4000/{conference-year}.

To run the site locally with Docker
```
docker-compose up
```

The `--watch` parameter passed to Jekyll in the `serve-local.sh` script means that you will not have to restart the server to see changes reflected on your locally running site. However, you always need to restart if you make changes to `_config.yml`.

The output of this command will tell you where the site is running locally. It will be something like `localhost:4000/$base_url/` (note the closing slash).

`$base_url` is whatever is set as the `baseurl` in [_config.yml](_config.yml), e.g. `localhost:4000/spa2019`.

To run the tests locally:

```
bundle exec htmlproofer --url-ignore "https://spaconference.org/scripts/myprofile.php,https://spaconference.org/scripts/makeproposal.php" --assume-extension --url-swap ^/$base_url: ./_site
```

where `$base_url` is as above, the `baseurl` in [_config.yml](_config.yml).

e.g.

```
bundle exec htmlproofer --assume-extension --url-swap ^/spa2019: ./_site
```

# To update the site

Do not commit to master. Raise a pull request with your changes and then merge to master when ready. [Travis](https://travis-ci.org/spaconference/spa-website) will run html-proofer on pull requests to confirm that all links exist. You can merge your own pull requests - please ensure all html proofer tests run green.

Merging to master will deploy your changes to the live site.  _(As of March 2021 present the deploy process appears to be failing for reasons that Eoin has not been able to work out, so the final update to the 2020 site has been deployed manually via FTP.  If we don't find a solution more quickly, we will fix this later in the year when Anna is available.)_

## If you want to add a page

Some of the common pages are already present in this repo but excluded from the build and the menu. If you want to use one of those pages:

- update the page
- comment it out in the exclusions section in [_config.yml](_config.yml).
- if it appears in the menu, comment it in in the `conference.site_navigation` array in [_config.yml](_config.yml)
it might also be excluded from displaying under the exclude: section of [_config.yml](_config.yml). This is used to control pages that should not be visible at the current stage of the conference preperation process but were needed earlier or later. Please try to avoid renaming pages.

If you want to add a brand new page, you just need to add it, and add it to the menu if appropriate.

## Adding the book now button

There is a styled button that appears above the menu. It is commented out in
[_includes/header.html](_includes/header.html) when booking is not open.
There is also a submit a session button in the same place that needs to available when the CfP is open.

1. Update the [book now](book-now.md) page with the correct details
1. Comment out the exclusion for the book now page in [_config.yml](_config.yml)
1. Uncomment the button in [_includes/header.html](_includes/header.html)

## How to handle internal navigation
The grey bar is a section header. It should always have the section name in it. For single page sections it will also be the header/title for the page as there is no point having the title twice. For any section that has multiple pages then the grey bar keeps the section title on every page and an H1 heading in and at the top of the text is the page header/title.

Any section that has multiple pages needs an internal navigation on the left hand side. For example the 'Lead a session' pages have internal navigation. To add a new page to a section with multiple pages you must do two things:
- Follow the pattern in [_includes/lead-a-session-nav.html](_includes/lead-a-session-nav.html) to add or remove pages from the internal navigation.
- Make sure new pages have `has-nav: lead-a-session` in the yaml front matter. See for example [lead-a-session.md](/lead-a-session.md).

## If a page is no longer needed

When a page has passed its time, DO NOT REMOVE IT, but comment it out in the menu if it appears. For example, the lead a session page will no longer be used after the CFP has closed, but should not become a 404; instead, update it to say the CFP has closed and remove it from the menu.

Please note, the deployment does not purge removed pages (because the programme is generated elsewhere and we do not want a deploy to delete the programme), so if there is a reason to remove a deployed page please contact the [administrator](mailto:website@spaconference.org).

## On change of year

Some changes need to be made after the conference to set up this project so that it publishes next year's site to next year's location. See the [SPA handbook](https://github.com/spaconference/spa-handbook/blob/master/website/change-of-year.md) for more details.
