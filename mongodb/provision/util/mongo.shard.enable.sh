mongo mongo-query-router:27017 -u mongo-admin -p --authenticationDatabase admin

mongo --eval 'use fdc'

mongo --eval 'sh.addShard( "mongo-shard-1:27017" )' fdc

mongo --eval 'db.databases.find()' config

