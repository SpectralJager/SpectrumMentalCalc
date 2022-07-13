package server

import (
	"context"
	"database/sql"

	pb "services/users/pkg/grpc/pb"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/status"
)

type UsersServer struct {
	pb.UnimplementedUsersServiceServer
	db *sql.DB
}

func (s *UsersServer) GetUser(ctx context.Context, req *pb.GetReq) (*pb.GetResp, error) {
	query := `select username, password from users where username=$1`
	row := s.db.QueryRow(query, req.GetUsername())
	var user pb.User = pb.User{}
	err := row.Scan(&user.Username, &user.PasswordHash)
	if err != nil {
		return nil, status.Error(codes.NotFound, "Can't find user...")
	}
	return &pb.GetResp{User: &user}, nil
}
func (s *UsersServer) SaveUser(ctx context.Context, req *pb.SaveReq) (*pb.SaveResp, error) {
	query := `insert into users (username, password) values ($1, $2)`
	_, err := s.db.Exec(query, req.User.Username, req.User.PasswordHash)
	if err != nil {
		return nil, status.Error(codes.Aborted, "Can't save user...")
	}
	return &pb.SaveResp{}, nil
}
func (s *UsersServer) UpdateUser(ctx context.Context, req *pb.UpdateReq) (*pb.UpdateResp, error) {
	query := `update users set username=$1, password=$2`
	_, err := s.db.Exec(query, req.User.Username, req.User.PasswordHash)
	if err != nil {
		return nil, status.Error(codes.Aborted, "Can't update user...")
	}
	return &pb.UpdateResp{}, nil
}
func (s *UsersServer) DeleteUser(ctx context.Context, req *pb.DeleteReq) (*pb.DeleteResp, error) {
	query := `delete from users where username=$1`
	_, err := s.db.Exec(query, req.User.Username)
	if err != nil {
		return nil, status.Error(codes.Aborted, "Can't delete user...")
	}
	return &pb.DeleteResp{}, nil
}

func CreateServer(database *sql.DB) *UsersServer {
	var server UsersServer = UsersServer{
		db: database,
	}
	return &server
}
