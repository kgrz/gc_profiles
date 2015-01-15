#
# Seek and Read file.
#
require 'tempfile'

GC::Profiler.enable

max = 200_000
str = "Hello world!  " * 1000
f = Tempfile.new('yarv-benchmark')
f.write str

max.times{
  f.seek 0
  f.read
}

GC::Profiler.report
GC::Profiler.disable
