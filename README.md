# Discourse Aparat Onebox

This plugin for Discourse, extends Onebox to add support for embedding videos from aparat.com in Discourse posts.

## Demo

See it in action and test it out for yourself on [Crit Cola's Discourse](https://critcola.com/?utm_source=github.com&utm_medium=readme&utm_term=demo&utm_content=discourse-playstv-onebox&utm_campaign=development).

## Installation

Add the plugin's repository URL to your container's `app.yml` file, for example:

```yml
hooks:
  after_code:
    - exec:
        cd: $home/plugins
        cmd:
          - mkdir -p plugins
          - git clone https://github.com/mhosseinab/discourse-aparat-onebox
```

Rebuild the container:

```
cd /var/discourse
./launcher rebuild app
```

For the plugin to apply retroactively, you'll need to rebake old posts:

```
cd /var/discourse
./launcher enter app
rake posts:rebake
```

## License

The Discourse Plays.tv Onebox plugin is released under the [MIT License](LICENSE).
