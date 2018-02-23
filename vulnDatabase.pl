%vuln( Desciprtion, [prereqs], [result], [Role-[key-(pred, [val]),...,key-(pred,[val])]] )

vuln('host-discovery', [], [discover_hosts], []).
vuln('port-scanning', [discover_hosts], [open_ports], []).

vuln('open-ftp', [open_ports], [port_21], []).
vuln('brute-force-login', [port_21], [ftp_access], []).
vuln('etc-shadow', [ftp_access], [shadow_file], []).
vuln('crack-passwords', [shadow_file], [passwords], []).
vuln('ssh-login', [port_22], [server_access])

vuln('open-ssh', [open_ports], [port_22], []).
vuln('brute-force-login', [port_22], [server_access], []).

vuln('web-access', [open_ports], [web_access], []).
vuln('enumerate-server', [port_80], [], []).

vuln('directory-traversal', [web_access], [], []).

vuln('sql-injection', [web_access], [database_queries], []).
vuln('db-query-users', [database_queries], [user_list, hashed_passwords], []).
vuln('crack-passwords', [hashed_passwords], [passwords], []).
vuln('login-ssh', [passwords, user_list, ssh_server], [shell_access], []).



% [apache-[version-(only, [2.4.27-2ubuntu3])], mysql-[tables-(exists, [users]), version-(only, [5.7.20-0ubuntu0.17.10.1])], php-[version-(only,
% [1:7.1+54ubuntu1]), script-(e    xists, [web])]]).

vuln('sql-injection', [web_access], [database_queries],
    [apache-[version-(only, ['2.4.27-2ubuntu3'])], mysql-[tables-(exists, [users]), version-(only, ['5.7.20-0ubuntu0.17.10.1'])], php-[version-(only, ['1:7.1+54ubuntu1']), script-(exists, [web])]]).
vuln('db-query-users', [database_queries], [user_list, hashed_passwords], [mysql-[tables-(exists, [users])]]).
vuln('crack-passwords', [hashed_passwords], [passwords], []).
vuln('login-ssh', [passwords, user_list, ssh_server], [shell_access], []).

%vuln('crack-passwords-login', [passwords, login_page], [unauthorized_access], []).
vuln('crack-passwords-login', [passwords, login_page], [bypass_login], []).

vuln('login-verbose', [web_access, login_page], [unauthorized_access],
	[apache-[version-(only, [2.4])], mysql-[tables-(exists, [users])], php-[version-(only, [5.5]), script-(exists, [web_login_verbose, web])]]).

vuln('brute-force-login', [web_access, login_page], [bypass_login],
	[apache-[version-(only, [latest])], mysql-[tables-(exists, [users]), version-(only, [latest])], php-[version-(only, [latest]), script-(exists, [web_login_brute_force])]]).

vuln('discover', [discover], [discover_weblogic_server], [server-[application-(exists, [web_logic])]]).
vuln('discover-weblogic', [discover_weblogic_server], [java_object_deserialization], [server-[application-(only, [web_logic])]]).

vuln('discover', [discover], [discover_websphere_server], [server-[application-(only, [websphere])]]).
vuln('discover-websphere', [discover_websphere_server], [java_object_deserialization], [server-[application-(only, [websphere])]]).

vuln('discover', [discover], [discover_jboss_server], [server-[application-(only, [jboss])]]).
vuln('discover-jboss', [discover_jboss_server], [java_object_deserialization], [server-[application-(only, [jboss])]]).

vuln('java-object-deserialization', [java_object_deserialization], [remote_code_execution], []).



vuln('open-telnet', [open_ports], [port_23], []).
vuln('server_access', [port_23], [server_access], []).
vuln('RCE', [server_access], [], []).
