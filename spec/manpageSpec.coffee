manpage = require '../src/manpage'

help = """
  --port  -p <n>   -- Specify a port to listen
  --path     <dir> -- Paths to load code and files
  --help  -h       -- Show this help manual
"""

rules = """
#######################################################################
[!default]                          --  Global default options
  --help        -h                  --  Show this help manual
#######################################################################
new|create            <name>...     --  Create new instances
  --path              <dir>         --  Paths to load code and files
#######################################################################
run|start|up                        --  Start an instance
  --config      -c    <file>        --  Load config file, override \\
                                        command options
#######################################################################
new run                             ##  Configure together
  --port        -p    <n>           --  Specify a port to listen
#######################################################################
add                   <plugin>...   --  Add plugins to current instance
#######################################################################
remove|rm|delete      <plugin>...   --  Remove plugins from current \\
                                        instance
#######################################################################
search|find           <plugin>...   --  Search plugins in local or \\
                                        on the Internet
  --local       -l                  --  Search in local repository
  --remote      -r                  --  Search in remote repository
#######################################################################
info                  <plugin>      --  Display the information of a \\
                                        plugin
#######################################################################
help                  <command>     --  Show help and options
#######################################################################
"""

man = new manpage()
console.log man.parse rules

# xdescribe 'A manpage', ->
#   man = new manpage()
#   it 'parse an argument spec', ->
#     man.parse