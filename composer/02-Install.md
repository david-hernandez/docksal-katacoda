https://getcomposer.org/doc/03-cli.md#install

The `install` command sets up your project using all of the information 
in the `composer.json` file. This is the power of a package manager. If you 
move the config file to another directory or computer, you can replicate 
all of the setup tasks and dependencies for the project.

In this directory you will find a `composer.json` file that is the result 
of the steps taken in the first step of the tutorial.

```$xslt
composer install
```

Run this command from the same location as the `composer.json` file.

```$xslt
1/11:	http://packagist.org/p/provider...
2/11:	http://packagist.org/p/provider...
3/11:	http://packagist.org/p/provider...
...
Finished: success: 11, skipped: 0, failure: 0, total: 11
Loading composer repositories with package information
Updating dependencies (including require-dev)
Nothing to install or update
Generating autoload files
```

Composer will read the json file and get to work. Even with no packages 
required in the json file it still performs certain setup tasks.

In the example above, Composer is downloading lists of providers. It doesn't 
have to do this every time, so you may not see it again after you run 
it the first time.

```$xslt
$ ls -l
README.md
composer.json
vendor
```

We can see here that one of the setup tasks is to create a `vendor` directory.
This is where Composer will put all the packages you will use in your project.

```$xslt
$ ls -l vendor/
autoload.php
composer
```

Without requiring any packages, Composer will still download and setup one thing. 
That is an autoloader. An autoloader is used by a PHP application to automatically 
load classes and interfaces. How that works is beyond the scope of this tutorial 
but it is something a lot of applications will take advantage of.
