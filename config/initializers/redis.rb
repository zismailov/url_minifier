uri = URI.parse(ENV.fetch("REDISTOGO_URL", "redis://localhost:6379/"))
Redis.current = Redis.new(host: uri.host, port: uri.port, password: uri.password)
