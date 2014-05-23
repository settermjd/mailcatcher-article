# Getting Started with MailCatcher Repository

## Introduction

The aim of this repository is to support the Sitepoint article, [Email Debugging with MailCatcher](http://www.sitepoint.com/email-debugging-mailcatcher/), which introduces developers to MailCatcher helps them test email dependent code as close to production as possible, but without the possibility of emailing clients accidentally (resulting in confusion, frustration or embarrassment, after their clients have received unexpected test emails).

## Getting Started

To get started with the project, simply clone it, then in the cloned project directory, run `vagrant up`. The project contains a Vagrant virtual machine configuration, which will install _Nginx_, _Memcache_, _MailCatcher_ and _PHP 5_. MailCatcher will be setup on port `8080` and be available at: `http://192.168.56.111:1080`.

## Bugs

If you find a bug in the code as always, let me know [by creating an issue](https://github.com/settermjd/mailcatcher-article/issues/). 

