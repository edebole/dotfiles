require "irb/completion"
require "hirb"
require 'wirble'
Wirble.init
Wirble.colorize

IRB.conf[:AUTO_INDENT] = true
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:HISTORY_FILE] = File::expand_path("~/.irbhistory")
IRB.conf[:EVAL_HISTORY] = 1_0000_000_000
IRB.conf[:SAVE_HISTORY] = 1_0000_000_000
