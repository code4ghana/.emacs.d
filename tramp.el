;; -*- emacs-lisp -*-
;; Tramp connection history.  Don't change this file.
;; You can delete it, forcing Tramp to reapply the checks.

((["scp" "jmichel" "10.226.92.186" nil]
  ("uname" "Linux 2.6.18-238.1.1.el5")
  ("test" "test")
  ("remote-path"
   ("/bin" "/usr/bin" "/usr/sbin" "/usr/local/bin"))
  ("remote-shell" "/bin/sh")
  ("perl-file-spec" t)
  ("perl-cwd-realpath" t)
  ("perl" "\\perl")
  ("readlink" "\\readlink")
  ("stat" "\\stat")
  ("file-exists" "test -e")
  ("id" "/usr/bin/id")
  ("gid-integer" 25)
  ("local-encoding" base64-encode-region)
  ("local-decoding" base64-decode-region)
  ("remote-encoding" tramp-perl-encode-with-module)
  ("remote-decoding" tramp-perl-decode-with-module)
  ("uid-integer" 30572)
  ("ls" "/bin/ls --color=never")
  ("ls-dired" t)
  ("~" "/home/jmichel"))
 (["scp" nil "jmichel" nil]
  nil))
