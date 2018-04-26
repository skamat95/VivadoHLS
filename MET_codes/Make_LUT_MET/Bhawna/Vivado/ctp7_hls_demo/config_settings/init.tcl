if {[regexp {^2016\.[12].*} [version -short]]} { set_param bitgen.maxThreads 1 }
