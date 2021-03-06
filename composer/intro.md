# Composer Tutorial
A walk through of various Composer tasks.

[Composer](//getcomposer.org/) is a dependency manager for PHP. It downloads
public PHP packages (projects, libraries, etc) from Packagist.org.

Each step in this tutorial goes over basic Composer usage. The original tutorial for this in the following git repo:
https://github.com/david-hernandez/composer-tutorial

## Background
The steps in this tutorial are based on building a [Drupal 8](//drupal.org) project with
Composer, since that was the original motivation for the tutorial. However,
most of what is explained is specific to Composer, not Drupal, so the
information should still be relevant to any PHP project. And since the Drupal 8
use-case is more complex than simple "Hello, World!" functionality, it shows
some of Composer's possibilities.

## Before you begin

You may see the environment performing some setup tasks. It is installing Composer for you. If it is still working as 
you start step 1, just let it finish. It should only take a moment.

As you progress through the steps, the environment does not reset. You will be working 
with the same project directory and files. Feel free to do whatever you want, but you will need to 
delete the `composer.lock` file and sometimes the contents of the project directory, to clean 
up from previous steps. Just use the `rm` command. This is an Ubuntu system.

Also, sometimes when you run the install command the system may take a while. Just 
let it run. There is nothing I can do about it.