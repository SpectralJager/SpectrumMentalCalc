package main

import (
	"fmt"
	"log"
	"net"
	authentication_service "smct/backend/internal/core/services/authentication"
	authorization_service "smct/backend/internal/core/services/authorization"
	result_service "smct/backend/internal/core/services/result"
	user_service "smct/backend/internal/core/services/user"
	"smct/backend/internal/handlers/grpc/gateway"
	result_repository "smct/backend/internal/repositories/result"
	token_repository "smct/backend/internal/repositories/token"
	user_repository "smct/backend/internal/repositories/user"

	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

func main() {

	server := gateway.NewGateway_v1(
		*authorization_service.NewAuthorizationService(
			*authentication_service.NewAuthenticationService(
				token_repository.NewTokenRepository("localhost", 6379, ""),
			),
			*user_service.NewUserService(
				user_repository.NewUserPGRepository("test", "", "localhost", 5432, "mental_calc_test"),
			),
		),
		*result_service.NewResultService(
			result_repository.NewResultPGRepository("test", "", "localhost", 5432, "mental_calc_test"),
		),
	)

	addr := fmt.Sprintf("localhost:%v", 8080)
	lis, err := net.Listen("tcp", addr)
	if err != nil {
		panic(err)
	}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(
			nil,
		),
	)
	gateway.RegisterV1Server(grpcServer, server)
	reflection.Register(grpcServer)
	log.Printf("Server start at %v", addr)
	grpcServer.Serve(lis)
}
