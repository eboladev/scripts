set f [open /etc/services]
set all [read $f]
close $f

foreach line [split $all "\n"] {
  puts $line
}
