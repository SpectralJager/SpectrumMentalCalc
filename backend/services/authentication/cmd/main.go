package main

import (
	"fmt"
	"log"
	"net"
	"os"

	"github.com/joho/godotenv"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"

	"services/authentication/pkg/db"
	pb "services/authentication/pkg/grpc/pb"
	"services/authentication/pkg/server"
)

func main() {
	godotenv.Load(".env")

	database, err := db.CreateConnection(os.Getenv("USERNAME"), os.Getenv("PASSWORD"), os.Getenv("DB_IP"), os.Getenv("DATABASE"))
	if err != nil {
		panic(err)
	}
	authenticationServer := server.CreateServer(database)

	addr := fmt.Sprintf("localhost:%v", os.Getenv("port"))
	lis, err := net.Listen("tcp", addr)
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
	log.Printf("Server start at %v", addr)
	grpcServer.Serve(lis)
}
