auto_html 
=========

auto_html is a gem for transforming URLs to appropriate resource (image, link, YouTube, Vimeo video,...). 
It's the perfect choice if you don't want to bother visitors with rich HTML editor or markup code, 
but you still want to allow them to embed video, images, links and more on your site, purely by pasting URL.

Check out the [live demo](http://rors.org/demos/auto_html).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'auto_html'
```

And then execute:

```sh
$ bundle
```

Or install it yourself as:

```sh
$ gem install auto_html
```

## Usage

    AutoHtml::Link.new.call('Hey! Checkout out my blog: http://rors.org') { simple_format; link(target: 'blank')
    => "<p>Hey! Checkout out my blog: <a href='http://rors.org' target='blank'>http://rors.org</a></p>"


## Bundled filters

For filter list and options they support check: <http://github.com/dejan/auto_html/tree/master/lib/auto_html/filters>


## MIT License

Copyright (c) 2015 Dejan Simic

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
