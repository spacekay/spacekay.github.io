# Jonghee Kim’s Portfolio

A bilingual Jekyll portfolio based on the [Freelancer theme](https://github.com/jeromelachaud/freelancer-theme).

Korean is the default at `/`; English is available at `/en/`. The navigation links switch languages without JavaScript. Both pages share the same layout, images, and project order.

The name, hero tagline, navigation labels, and main section headings stay in English on both pages. Project descriptions, career entries, and supporting labels follow the selected language.

## Editing content

- `_data/locales.yml`: Korean and English navigation, headings, introduction, metadata, and footer copy. Keep the keys in both language sections aligned.
- `_data/timeline.yml`: Shared career dates with `ko` and `en` descriptions. Omit `end` for a current position.
- `_data/skills.yml`: Shared technology names; group labels are translated in `locales.yml`.
- `_posts/*.markdown`: Korean project fields at the top level, with matching English fields under `en`. Translate `title`, `alt`, `project-date`, `client`, `category`, and `description` for every project. Keep IDs, image filenames, dates, and URLs shared. Use `details_url` for an optional detail page; its content is maintained separately.
- `_config.yml`: Shared site settings. Keep the Korean feed description aligned with the Korean description in `locales.yml`.

Social links use inline SVGs from Font Awesome Free 6.1.2 in `_includes/icons/` so the logos do not depend on webfont loading. Each `social.title` in `_config.yml` must match an SVG filename. Preserve the attribution comments in these SVGs and the [Font Awesome license](css/font-awesome/LICENSE.txt). SVG paths are unchanged from [upstream](https://github.com/FortAwesome/Font-Awesome/tree/6.1.2/svgs/brands); sizing, color, and accessibility attributes are applied for this site. Brand marks belong to their respective owners and are used only to link to the corresponding profiles. Follow the [GitHub](https://brand.github.com/foundations/logo) and [LinkedIn](https://brand.linkedin.com/in-logo) usage guidelines when updating them.

Project descriptions use YAML folded strings (`>-`); `<br>` separates paragraphs. Keep career dates and project participation periods consistent between languages. Distinguish past plans from released features when updating project copy.

## Local development

Use a separate development Ruby rather than macOS’s system Ruby. The repository's `.ruby-version` records the verified Ruby 3.4.12 environment, and `Gemfile.lock` records the resolved gems and Bundler 2.6.9. The inherited gemspec requires Bundler 2.x.

For a new Homebrew setup:

```sh
brew install ruby@3.4
gem install bundler -v 2.6.9
```

Confirm that `ruby -v` uses the development Ruby, then run:

```sh
bundle _2.6.9_ install
bundle exec jekyll serve
```

Open `/` and `/en/` on the local server. Check the language links, mobile menu, and each project dialog in both languages.

```sh
bundle exec jekyll build --strict_front_matter
```

The existing `bundle exec rake test` task also checks links with HTMLProofer and requires network access. Deployment continues to use the existing GitHub Pages setup.

The inherited empty post permalinks produce a Jekyll warning because project posts share `/index.html` as their output destination. The portfolio currently renders these posts as dialogs; this change preserves that existing URL setup.

## Dependency maintenance

Commit `Gemfile.lock` with dependency changes so local installs use the same resolved versions. Keep gems installed for other projects intact; use a checkout-specific bundle when isolation is needed:

```sh
bundle config set --local path vendor/bundle
bundle _2.6.9_ install
```

Both `.bundle/` and `vendor/bundle/` are ignored. This setting applies only to this checkout. To undo a committed cleanup, revert that commit and run `bundle _2.6.9_ install` again.

The gemspec retains Jekyll, the local preview server, Rake, and HTMLProofer. Pagination, sitemap, gist, emoji, feed, and theme-data plugins are not needed by the current layout: `_data/` is native to Jekyll, and `feed.xml` is maintained directly. The inherited theme packaging structure remains in place to keep this cleanup small.

The current layout has no contact form or Disqus section, so their scripts and form validation plugin are not loaded. Inherited contact templates and assets remain in the repository; restoring that feature also requires restoring its scripts. jQuery, Bootstrap, and the navigation animation helpers remain at their existing versions.

GitHub Pages continues to build `master` with its managed Jekyll environment. The Ruby version and lockfile describe local development; they do not pin the managed Pages builder. Changes to deployment settings or build tooling should be handled separately.
