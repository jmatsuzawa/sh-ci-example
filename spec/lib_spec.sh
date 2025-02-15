Describe "is_dir()"
  Include "lib/lib.sh"

  It "returns exit status 0, if the argument is a directory"
    When call is_dir "/tmp"
    The status should be success
  End

  It "returns exit status 1, if the argument is not a directory"
    When call is_dir inexistent_dir
    The status should be failure
    The stderr should eq "The directory is not found: inexistent_dir"
  End
End

Describe "find_duplicate_files()"
  Include "lib/lib.sh"

  result() { %text
    #|find duplicate files: testdata
    #|30cf3d7d133b08543cb6c8933c29dfd7  testdata/sameB01.txt
    #|30cf3d7d133b08543cb6c8933c29dfd7  testdata/sameB02.txt
    #|bf072e9119077b4e76437a93986787ef  testdata/sameA01.txt
    #|bf072e9119077b4e76437a93986787ef  testdata/sameA02.txt
  }

  It "prints duplicate files from testdata directory"
    When call find_duplicate_files testdata
    The status should be success
    The output should equal "$(result)"
  End
End