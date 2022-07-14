package server

import (
	"context"
	"database/sql"
	"log"
	pb "services/authentication/pkg/grpc/pb"

	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

type AuthenticationServer struct {
	pb.UnimplementedAuthenticationServiceServer
	db *sql.DB
}

func (s *AuthenticationServer) RegisterToken(ctx context.Context, req *pb.RegReq) (*pb.RegResp, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	val, ok := md["token"]
	if !ok {
		return nil, status.Error(codes.InvalidArgument, "Empty token")
	}

	sqlStr := `insert into tokens (token) values ($1)`
	result, err := s.db.Exec(sqlStr, val[0])
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Something goes wrong: %v", err)
	}
	num, _ := result.RowsAffected()
	if num == 0 {
		return nil, status.Error(codes.InvalidArgument, "Invalid token")
	}

	return &pb.RegResp{}, nil
}
func (s *AuthenticationServer) RemoveToken(ctx context.Context, req *pb.RemoveReq) (*pb.RemoveResp, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	val, ok := md["token"]
	if !ok {
		return nil, status.Error(codes.InvalidArgument, "Empty token")
	}

	sqlStr := `delete from tokens where token=$1`
	result, err := s.db.Exec(sqlStr, val[0])
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Something goes wrong: %v", err)
	}
	num, _ := result.RowsAffected()
	if num == 0 {
		return nil, status.Error(codes.InvalidArgument, "Invalid token")
	}

	return &pb.RemoveResp{}, nil
}
func (s *AuthenticationServer) CheckToken(ctx context.Context, req *pb.CheckReq) (*pb.CheckResp, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	log.Println(md)
	val, ok := md["token"]
	if !ok {
		return nil, status.Error(codes.InvalidArgument, "Empty token")
	}

	sqlStr := `select token from tokens where token=$1`
	result := s.db.QueryRow(sqlStr, val[0])
	err := result.Err()
	if err != nil {
		return nil, status.Errorf(codes.Internal, "Something goes wrong: %v", err)
	}

	return &pb.CheckResp{}, nil
}

func CreateServer(database *sql.DB) *AuthenticationServer {
	return &AuthenticationServer{
		db: database,
	}
}
