https://getcomposer.org/doc/04-schema.md#require-dev

Sometimes there are things you want to use in your project, but only when developing. 
Testing frameworks, debugging tools, etc. Composer has a section for this called `require-dev`.

You can add this section to your `composer.json` file or use the `require` command 
to include these development dependencies. Just add `--dev` to the end of the `require` 
command.

```$xslt
composer require drupal/console --dev
```

Drupal Console is a development tool specifically designed to work with Drupal. It 
is based on Symfony's Console project. It's handy, but something only needed when 
developing, not on a production server.

After running this, let's look at the result.

```$xslt
$ composer require drupal/console --dev
...
Using version dev-master for drupal/console
./composer.json has been updated
Loading composer repositories with package information
Updating dependencies (including require-dev)
...
Loading composer repositories with package information
Installing dependencies (including require-dev) from lock file
Nothing to install or update
Generating autoload files
```

As you can see, Console requires a whole bunch of stuff, and that stuff requires 
a whole bunch of other stuff. This one package jumps the codebase up a notch in size.

Let's take a look at the `composer.json` file.

```$xslt
{
    "name": "david-hernandez/composer-tutorial",
    "description": "My fancy new composer project."
    "type": "project",
    "authors": [
        {
            "name": "David Hernandez",
            "email": "david@example.com"
        }
    ],
    "minimum-stability": "dev",
    "require": {
        "drupal/drupal": "8.6.x-dev"
    },
    "require-dev": {
        "drupal/console": "dev-master"
    }
}
```

Not much has changed, but we do have the new `require-dev` section with 
Drupal Console in it. And, once again, it downloaded the dev branch of the 
package, because we didn't specify a version, and we set `minimum-stability` 
to `dev`.

Take a look at the lock file now. **It is huge!** We went from a three hundred 
line file to a three _thousand_ line file.

## Using `composer install` with Development Dependencies

Here is the gotcha you need to know. When you run `composer install` it 
will retrieve everything in the `require` section **and** the `require-dev` 
section. It defaults to assuming you are running these commands while developing 
your project.

When building for production, or any case when you don't want the development 
dependencies, run `composer install --no-dev`. This will ignore the `require-dev` 
section.

Also note, including `require-dev` when you install is a root-level operation only. 
Composer will not include the development dependencies of the packages it retrieves. 
It assumes I'm developing my project, not Drupal Console or any of the other packages.