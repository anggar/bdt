mongo mongo-query-router:27017 -u mongo-admin -p --authenticationDatabase admin

mongo mongo-query-router:27017/fdc -u mongo-admin -ppassword --authenticationDatabase admin --eval 'sh.enableSharding("fdc")'
mongo mongo-query-router:27017/fdc -u mongo-admin -ppassword --authenticationDatabase admin --eval 'db.ratings.ensureIndex( { _id : "hashed" } ); sh.shardCollection( "fdc.food", { "_id" : "hashed" } )'
mongo mongo-query-router:27017/fdc -u mongo-admin -ppassword --authenticationDatabase admin --eval 'db.ratings.ensureIndex( { _id : "hashed" } ); sh.shardCollection( "fdc.food_nutrient", { "_id" : "hashed" } )'
mongo mongo-query-router:27017/fdc -u mongo-admin -ppassword --authenticationDatabase admin --eval 'db.ratings.ensureIndex( { _id : "hashed" } ); sh.shardCollection( "fdc.nutrient", { "_id" : "hashed" } )'

mongoimport -h mongo-query-router -d fdc -c food -u mongo-admin -ppasword--authenticationDatabase admin --type csv --file /vagrant/dataset/food.csv --headerline
mongoimport -h mongo-query-router -d fdc -c food -u mongo-admin -ppasword--authenticationDatabase admin --type csv --file /vagrant/dataset/food_nutrient.csv --headerline
mongoimport -h mongo-query-router -d fdc -c food -u mongo-admin -ppasword--authenticationDatabase admin --type csv --file /vagrant/dataset/nutrient.csv --headerline
