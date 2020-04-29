proc external_editor {filename linenumber} {
 exec "youreditor" $linenumber $filename &   # edit as required
}
set PrefSource(altEditor) external_editor