require "redis"

redis = Redis.new
redis.flushdb

redis.set("motion:hggxezeqkii96lfpvl492h", "{\"motion_component\":true,\"render_hash\":14955718878113070646,\"text_content\":\"Add\",\"count\":0}\x00ButtonComponent")

redis.set("motion:gkhe7qqyou5vik9e9ca2ik", "{\"motion_component\":true,\"render_hash\":8667389315068159877,\"count\":0}\x00TickerComponent")

puts redis.get("motion:hggxezeqkii96lfpvl492h")
puts redis.get("motion:gkhe7qqyou5vik9e9ca2ik")

pp redis.del("motion:hggxezeqkii96lfpvl492h")
pp redis.del("motion:gkhe7qqyou5vik9e9ca2ik")
