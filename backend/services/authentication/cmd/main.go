package main

import (
	"log"
	"net"
	"os"
	"strconv"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"services/authentication/pkg/db"
	pb "services/authentication/pkg/grpc/pb"
	"services/authentication/pkg/server"
)

func main() {
	godotenv.Load(".env")

	temp, _ := strconv.Atoi(os.Getenv("DATABASE"))
	database, err := db.CreateConnection(os.Getenv("DB_IP"), os.Getenv("PASSWORD"), temp)
	if err != nil {
		panic(err)
	}
	authenticationServer := server.CreateServer(database)

	lis, err := net.Listen("tcp", "localhost:8081")
	if err != nil {
		panic(err)
	}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(
			nil,
		),
	)
	pb.RegisterAuthenticationServiceServer(grpcServer, authenticationServer)
	reflection.Register(grpcServer)
	log.Printf("Server start at localhost:%d", 8081)
	grpcServer.Serve(lis)
}
