CREATE USER 'm5proggebruiker'@'%'
identified with sha256_password BY 'tuffboi21';

GRANT select ON m5prog.* TO 'm5proggebruiker'@'%';
FLUSH privileges;

revoke select on m5prog.* from 'm5proggebruiker'@'%';
FLUSH PRIVILEGES;