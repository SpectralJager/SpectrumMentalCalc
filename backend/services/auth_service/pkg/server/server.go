package server

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"net"

	"github.com/SpectralJager/SpectrumMentalCalc/backend/pkg/config"
	"github.com/SpectralJager/SpectrumMentalCalc/backend/pkg/db"
	pb "github.com/SpectralJager/SpectrumMentalCalc/backend/pkg/grpc/pb"
	"google.golang.org/grpc"
	"google.golang.org/grpc/reflection"
)

type server struct {
	pb.UnimplementedAuthServer
	db sql.DB
}

func (s *server) Login(ctx context.Context, req *pb.LoginRequest) (*pb.LoginResponse, error) {
	sqlStr := fmt.Sprintf("select id, username from users where username = '%s' and password = '%s'", req.User.Username, req.User.PasswordHash)
	_, err := s.db.Query(sqlStr)
	if err != nil {
		return &pb.LoginResponse{Result: "Incorect password or username", Token: ""}, err
	}
	return &pb.LoginResponse{Result: "login", Token: "1"}, nil
}

func (s *server) Register(ctx context.Context, req *pb.RegisterRequest) (*pb.RegisterResponse, error) {
	sqlStr := fmt.Sprintf("insert into users (username, password) values ('%v', '%v')", req.User.Username, req.User.PasswordHash)
	_, err := s.db.Exec(sqlStr)
	if err != nil {
		return &pb.RegisterResponse{Result: "Incorect password or username", Token: ""}, err
	}
	return &pb.RegisterResponse{Result: "registered", Token: "2"}, nil
}

func (s *server) GetUser(ctx context.Context, req *pb.UserRequest) (*pb.UserResponse, error) {
	sqlStr := fmt.Sprintf("select username, password from users where username = '%v'", req.Username)
	row := s.db.QueryRow(sqlStr)
	username, passwordHash := "", ""
	err := row.Scan(&username, &passwordHash)
	if err != nil {
		return &pb.UserResponse{Result: "Incorect username", User: &pb.User{}}, err
	}
	var user = pb.User{
		Username:     username,
		PasswordHash: passwordHash,
	}
	return &pb.UserResponse{Result: "user", User: &user}, nil
}

func StartAuthServer(port int) {
	lis, err := net.Listen("tcp", fmt.Sprintf("localhost:%d", port))
	if err != nil {
		log.Fatalf("Cant create listener: %v", err)
	}
	conf, err := config.GetConfig("config.yaml")
	if err != nil {
		log.Fatalf("Cant get config: %v", err)
	}
	database, err := db.CreateConnection(conf["username"].(string), conf["password"].(string), conf["database_ip"].(string), conf["database"].(string))
	if err != nil {
		log.Fatalf("Cant create db connnection: %v", err)
	}
	grpcServer := grpc.NewServer(
		grpc.UnaryInterceptor(
			LoggerInterceptor,
		),
	)
	pb.RegisterAuthServer(grpcServer, &server{db: *database})
	reflection.Register(grpcServer)
	log.Printf("Server start at localhost:%d", port)
	grpcServer.Serve(lis)

}
