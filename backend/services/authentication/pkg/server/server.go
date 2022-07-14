package server

import (
	"context"
	pb "services/authentication/pkg/grpc/pb"

	"github.com/go-redis/redis/v8"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

type AuthenticationServer struct {
	pb.UnimplementedAuthenticationServiceServer
	db *redis.Client
}

func (s *AuthenticationServer) RegisterToken(ctx context.Context, req *pb.RegReq) (*pb.RegResp, error) {
	return nil, status.Errorf(codes.Unimplemented, "method RegisterToken not implemented")
}
func (s *AuthenticationServer) RemoveToken(ctx context.Context, req *pb.RemoveReq) (*pb.RemoveResp, error) {
	return nil, status.Errorf(codes.Unimplemented, "method RemoveToken not implemented")
}
func (s *AuthenticationServer) CheckToken(ctx context.Context, req *pb.CheckReq) (*pb.CheckResp, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	_, ok := md["token"]
	if ok {
		return nil, status.Error(codes.InvalidArgument, "Empty token")
	}
	return &pb.CheckResp{}, nil
}

func CreateServer(database *redis.Client) *AuthenticationServer {
	return &AuthenticationServer{
		db: database,
	}
}
