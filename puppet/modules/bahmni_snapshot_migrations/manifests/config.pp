class bahmni_snapshot_migrations::config inherits global {
  $os_path="${::global::os_path}"
  $db_server="${::global::db_server}"
}