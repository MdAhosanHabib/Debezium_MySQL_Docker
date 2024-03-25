# In Docker Compose, Change Data Capture (CDC) with Apache Kafka and Debezium from MySQL Container
![MySQL_to_Kafka_Debezium](https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/assets/43145662/442208ff-125a-4838-9412-536984fdf83b)

This repository contains a Docker Compose setup for implementing Change Data Capture (CDC) using Apache Kafka and Debezium. CDC is a method of tracking changes to data in a database and propagating those changes to other systems in real time.

## Prerequisites
1. Docker

2. Docker Compose

It should be installed on our server.

## Setup Instructions
#### MySQL Database
MySQL database server running version 8.0.

Configured with a root user and sample database.

#### Zookeeper
Apache Zookeeper for coordinating distributed systems.

#### Kafka
Apache Kafka broker for building real-time streaming data pipelines.

Configured with advertised listeners and topics for CDC.

#### Kafka Connect
Debezium Kafka Connect container for capturing database changes and publishing them to Kafka topics.

Uses the Debezium MySQL connector to monitor the MySQL database for changes.

##### Kafdrop
Web UI for browsing Kafka topics, partitions, and messages.
Provides insights into the data flowing through Kafka.

The mentioned services are lunch the following docker-compose file:
https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/blob/main/docker-compose.yml

Also, need to set the MySQL configuration file to enable Binlog to capture the changes from MySQL.
https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/blob/main/my.cnf

Create these containers with the command:
```bash
[root@db1 DataEngineering]# docker compose up -d
```

## MySQL user and database creation with SQLyog
First of all, create users as per needed permission from the local terminal by this command:
```bash
[root@db1 DataEngineering]# docker exec -it mysql /bin/bash
bash-4.4# mysql -u root -p
Enter password:
```
We need to create a table and insert some data into this table for testing. An example file is:
https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/blob/main/test_insert.sql
<img width="960" alt="SQLyog" src="https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/assets/43145662/82646ba5-c9d1-4658-af45-4daf41730a24">

## Debezium connector initiated with MySQL
The connection starts with an JSON config file, here:
https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/blob/main/mysql-debezium-connector.json

It should be started and status-checked by these commands:
```bash
[root@db1 DataEngineering]# curl -X POST -H "Content-Type: application/json" --data @mysql-debezium-connector.json http://192.168.141.135:8083/connectors
[root@db1 DataEngineering]# curl -X GET http://192.168.141.135:8083/connectors/mysql-connector
```

## Check changes in Kafka topic from Kafdrop UI tools
Now we can get data that is inserted in the ahosan database. By accessing: http://192.168.141.135:9000
<img width="960" alt="kafdrop" src="https://github.com/MdAhosanHabib/Debezium_MySQL_Docker/assets/43145662/02b1047a-7a09-46d1-817b-d7f83da4a4f9">

That's all

Regards from Ahosan.

Medium: 
