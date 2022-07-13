package server

import (
	"context"
	"fmt"
	"log"

	"google.golang.org/grpc"
	"google.golang.org/grpc/metadata"
)

func (s *UsersServer) Interceptor(ctx context.Context, req interface{}, info *grpc.UnaryServerInfo, handler grpc.UnaryHandler) (resp interface{}, err error) {
	md, _ := metadata.FromIncomingContext(ctx)
	log.Printf("->> %v", info.FullMethod)
	for key, value := range md {
		fmt.Printf("\t'%v': %v\n", key, value)
	}
	return handler(ctx, req)
}
