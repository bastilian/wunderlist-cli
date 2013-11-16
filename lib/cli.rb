require 'yaml'
require 'thor'
require 'fog/wunderlist'

module Cli
  module Ui
    def puts_padded(left, padding=" ", right=nil)
      left = left[0, 60] if left.length > 60
      pad_to = right ? 80-right.size : 80
      puts (left.ljust(pad_to, (padding)) + (right||""))
    end
  end
end

require 'cli/client'
require 'cli/lists'
require 'cli/base'