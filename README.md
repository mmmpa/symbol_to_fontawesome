# SymbolToFontawesome

More short.

## Installation

```ruby
gem 'symbol_to_fontawesome'
```

    $ bundle install

## Usage

```ruby
:ban.fa
# <i class="fa fa-ban"></i>

:ban.fa(4)
# <i class="fa fa-ban fa-4x"></i>

:ban.fa(:left)
# <i class="fa fa-ban fa-pull-left"></i>

:stack.fa(:lg){
  stack :square_o, 2
  stack :twitter, 1
}
# <span class="fa-stack fa-lg"><i class="fa fa-square-o fa-stack-2x"></i><i class="fa fa-twitter fa-stack-1x"></i></span>
```

[More](./spec/symbol_to_fontawesome_spec.rb)
