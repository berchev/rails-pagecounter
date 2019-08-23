REDIS = Redis.new(host: 'localhost', port: 6379, db: 1, password: 'georgiman')

$incr_stat = []
$decr_stat = []
$reset_stat = []