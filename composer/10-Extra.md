https://getcomposer.org/doc/04-schema.md#extra

Composer supports adding an `extra` section for supplying arbitrary information scripts might need. We'll 
use this to supply information that the Drupal scaffolder will use.

When we first setup a project, one of the questions asked us for a `type`. The answer we gave was `project`, since 
that is what most projects use. Drupal has a list of its own types, which comes in handy when using Composer. 
If you look at the `composer.json` in the `core` directory or any of the module directories from the 
previous steps, you'll see their types declared.

Drupal 8 declares itself as `drupal-core`, modules declare themselves as `drupal-module`, themes as `drupal-theme`, 
and so forth. Using this information, we can tell the scaffolder where to put these files when retrieving 
core, modules, theme, and everything else. This goes for the original setup and when later requiring new dependencies.

```$xslt
"extra": {
    "installer-paths": {
        "docroot/core": ["type:drupal-core"],
        "docroot/libraries/{$name}": ["type:drupal-library"],
        "docroot/modules/contrib/{$name}": ["type:drupal-module"],
        "docroot/profiles/contrib/{$name}": ["type:drupal-profile"],
        "docroot/themes/contrib/{$name}": ["type:drupal-theme"],
        "drush/contrib/{$name}": ["type:drupal-drush"]
    }
  }
```

As you can see, the scaffolder will now put the Drupal-related things in a `docroot` directory. (You can define 
any path here you want.) Drush, is a command-line tool, so we want to leave it outside the document root (which will 
be publicly accessible.) The vendor directory, which defaults to the root of the project directory, will also be outside of the 
document root. But we don't define the vendor directory here, because Composer takes care of that itself.

>Remember to delete any folders or files in your project directory that might be in the way.

Now, when running `composer install` we get a much more structured project.

```$xslt
$ ls -l
composer.json
composer.lock
docroot
vendor
```
Drupal 8 (core) is nicely built inside the docroot.

```$xslt
$ ls -l docroot/
.csslintrc
.editorconfig
.eslintignore
.eslintrc.json
.gitattributes
.ht.router.php
.htaccess
autoload.php
core
index.php
robots.txt
sites
update.php
web.config
```

And, when we require a new Drupal module as a dependency, Composer will put it in the right place. 
Thanks to the scaffolder and our `extra` info.

```$xslt
$ composer require drupal/devel
 
Using version ^1.2 for drupal/devel
./composer.json has been updated
Loading composer repositories with package information
Updating dependencies (including require-dev)
    1/1:	https://ftp.drupal.org/files/projects/devel-8.x-1.2.zip
    Finished: success: 1, skipped: 0, failure: 0, total: 1
Package operations: 1 install, 0 updates, 0 removals
  - Installing drupal/devel (1.2.0): Loading from cache
Writing lock file
Generating autoload files
 
 
$ ls -l docroot/modules/contrib/
 
devel
```

**For Drupal folks, note that this DOES NOT install the module. It only downloads it and places it 
in the right directory. You still need to install the module in one of the usual Drupal ways, like 
through the web interface.**