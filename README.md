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

Project descriptions use YAML folded strings (`>-`); `<br>` separates paragraphs. Keep career dates and project participation periods consistent between languages. Distinguish past plans from released features when updating project copy.

## Local development

Use a separate development Ruby rather than macOS’s system Ruby. This site has been verified with Homebrew Ruby 3.4.12 and Bundler 2.6.9. The inherited gemspec requires Bundler 2.x.

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
