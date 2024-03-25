select user, host, plugin from mysq.user;
DROP USER 'root'@'%';

CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'ahosan';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


CREATE USER 'ahosan'@'%' IDENTIFIED WITH mysql_native_password BY 'ahosan';
GRANT ALL PRIVILEGES ON *.* TO 'ahosan'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;


--it is executed from SQL-Yog
CREATE TABLE ahosan.my_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    NAME VARCHAR(50),
    age INT
);

INSERT INTO ahosan.my_table (NAME, age) VALUES ('John', 30), ('Alice', 25), ('Bob', 35), ('Emily', 28);

SELECT * FROM ahosan.my_table;
