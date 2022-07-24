package gateway

import (
	context "context"
	"smct/backend/internal/core/domain"
	authorization_service "smct/backend/internal/core/services/authorization"
	result_service "smct/backend/internal/core/services/result"

	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

type Gateway_v1 struct {
	UnimplementedV1Server
	authorizationService authorization_service.AuthorizationService
	resultsService       result_service.ResultService
}

func NewGateway_v1(
	authorizationService authorization_service.AuthorizationService,
	resultsService result_service.ResultService,
) *Gateway_v1 {
	return &Gateway_v1{
		authorizationService: authorizationService,
		resultsService:       resultsService,
	}
}

func (s *Gateway_v1) Login(ctx context.Context, req *LoginReq) (*LoginResp, error) {
	token, err := s.authorizationService.Login(req.User.Username, req.User.Password)
	if err != nil {
		return nil, status.Error(codes.Unauthenticated, err.Error())
	}
	return &LoginResp{Token: string(*token)}, nil
}

func (s *Gateway_v1) Register(ctx context.Context, req *RegisterReq) (*RegisterResp, error) {
	token, err := s.authorizationService.Register(req.NewUser.Username, req.NewUser.Password)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, err.Error())
	}
	return &RegisterResp{Token: string(*token)}, nil
}

func (s *Gateway_v1) UpdateProfile(ctx context.Context, req *UpdateProfileReq) (*UpdateProfileResp, error) {
	newUser := domain.NewUser(req.NewUser.Username, req.NewUser.Password)
	oldUser := domain.NewUser(req.OldUser.Username, req.OldUser.Password)
	if err := s.authorizationService.UserService.Update(newUser, oldUser); err != nil {
		return nil, status.Errorf(codes.InvalidArgument, err.Error())
	}

	s.authorizationService.AuthenticationService.DeleteToken(oldUser.Username)
	token, err := s.authorizationService.AuthenticationService.CreateToken(newUser.Username)
	if err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}

	for _, tp := range domain.GameType {
		for _, md := range domain.GameMode {
			oldResult, _ := s.resultsService.Get(tp, md, oldUser.Username)
			newResult := domain.NewResult(tp, md, oldResult.Scores, newUser.Username, oldResult.Lvl)
			s.resultsService.Update(newResult, oldResult)
		}
	}
	return &UpdateProfileResp{Token: string(*token)}, nil
}

func (s *Gateway_v1) SaveResult(ctx context.Context, req *SaveRecordReq) (*SaveRecordResp, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SaveResult not implemented")
}

func (s *Gateway_v1) GetResult(ctx context.Context, req *GetResultReq) (*Results, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetResult not implemented")
}

func (s *Gateway_v1) GetResults(ctx *GetResultsReq, req V1_GetResultsServer) error {
	return status.Errorf(codes.Unimplemented, "method GetResults not implemented")
}
