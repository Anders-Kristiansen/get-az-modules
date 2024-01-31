# Update all modules
Update-Module -Force
# Remove versions that have newer version installed
foreach ($current in (Get-InstalledModule)) {
  $all = Get-InstalledModule -Name $current.Name -AllVersions;
  foreach ($m in $all) {
     if(-not($m.Version -eq $current.Version)) {
         "$($m.Name): Removing $($m.Version) (keeping $($current.Version))";
         Uninstall-Module -Name $m.Name -RequiredVersion $m.Version -Force;
     }
  }
}
