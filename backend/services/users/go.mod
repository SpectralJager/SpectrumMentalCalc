module services/users

go 1.18

require (
	github.com/joho/godotenv v1.4.0
	github.com/lib/pq v1.10.6
	google.golang.org/grpc v1.48.0
	google.golang.org/protobuf v1.28.0
	services/authentication v0.0.0-00010101000000-000000000000
)

require (
	github.com/golang/protobuf v1.5.2 // indirect
	golang.org/x/net v0.0.0-20210428140749-89ef3d95e781 // indirect
	golang.org/x/sys v0.0.0-20211216021012-1d35b9e2eb4e // indirect
	golang.org/x/text v0.3.6 // indirect
	google.golang.org/genproto v0.0.0-20200526211855-cb27e3aa2013 // indirect
)

replace services/authentication => ../authentication
