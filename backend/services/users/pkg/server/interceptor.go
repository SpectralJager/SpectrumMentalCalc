package server

import (
	"context"
	"fmt"
	"log"

	authenticationPb "services/authentication/pkg/grpc/pb"

	"google.golang.org/grpc"
	"google.golang.org/grpc/codes"
	"google.golang.org/grpc/credentials/insecure"
	"google.golang.org/grpc/metadata"
	"google.golang.org/grpc/status"
)

func (s *UsersServer) Interceptor(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (interface{}, error) {
	md, _ := metadata.FromIncomingContext(ctx)
	// logging
	log.Printf("->> %v", info.FullMethod)
	fmt.Printf("\t'%v': %v\n", md.Get(":authority"), md.Get("user-agent"))
	// authentication
	conn, err := grpc.Dial("localhost:8081", grpc.WithTransportCredentials(insecure.NewCredentials()))
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}
	defer conn.Close()
	authenticationClient := authenticationPb.NewAuthenticationServiceClient(conn)
	_, err = authenticationClient.CheckToken(metadata.AppendToOutgoingContext(ctx, "token", md.Get("token")[0]), &authenticationPb.CheckReq{})
	if err != nil {
		return nil, err
	}

	return handler(ctx, req)
}
