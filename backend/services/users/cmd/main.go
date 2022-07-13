package main

import (
	"log"
	"net"
	"os"
	"services/users/pkg/db"
	pb "services/users/pkg/grpc/pb"
	"services/users/pkg/server"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {
	godotenv.Load(".env")

	database, err := db.CreateConnection(os.Getenv("USERNAME"), os.Getenv("PASSWORD"), os.Getenv("DB_IP"), os.Getenv("DATABASE"))
	if err != nil {
		panic(err)
	}
	userServer := server.CreateServer(database)

	lis, err := net.Listen("tcp", "localhost:8080")
	if err != nil {
		panic(err)
	}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(
			userServer.Interceptor,
		),
	)
	pb.RegisterUsersServiceServer(grpcServer, userServer)
	reflection.Register(grpcServer)
	log.Printf("Server start at localhost:%d", 8080)
	grpcServer.Serve(lis)
}
