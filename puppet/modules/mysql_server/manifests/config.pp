class mysql_server::config inherits global {
  $deployment_log_expression="${::global::deployment_log_expression}"
  $app_server="${::global::app_server}"
}