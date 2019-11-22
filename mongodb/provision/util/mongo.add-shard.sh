mongo mongo-query-router:27017 -u mongo-admin -p --authenticationDatabase admin

mongo --eval 'sh.addShard( "mongo-shard-1:27017" )'
mongo --eval 'sh.addShard( "mongo-shard-2:27017" )'

mongo --eval 'sh.addShard( "rs0/mongo-repl-1:27017,mongo-repl-2:27017,mongo-repl-3:27017" )'
