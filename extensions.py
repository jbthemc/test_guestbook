import os
import redis
from flaskext.mysql import MySQL  

mysql = MySQL()
cache = redis.Redis(host=os.getenv('REDIS_HOST'), port=6379)
