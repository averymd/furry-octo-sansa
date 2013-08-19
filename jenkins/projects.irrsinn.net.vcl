backend jenkins {
  .host = "projects.irrsinn.net";
  .port = "8080";
  .connect_timeout = 300s;
  .first_byte_timeout = 120s;
  .between_bytes_timeout = 300s;
  .max_connections = 800;
}

backend git {
  .host = "projects.irrsinn.net";
  .port = "8088";
  .connect_timeout = 300s;
  .first_byte_timeout = 120s;
  .between_bytes_timeout = 300s;
  .max_connections = 800;
}

sub vcl_recv {
  
  if ((req.http.host ~ "projects.irrsinn.net") && (req.url ~ "jenkins"))
  {
    set req.backend = jenkins;
  } else {
    set req.backend = git;
  }
  return (pass);
}
