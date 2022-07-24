package gateway

import (
	context "context"
	"log"
	"smct/backend/internal/core/domain"
	authentication_service "smct/backend/internal/core/services/authentication"
	result_service "smct/backend/internal/core/services/result"
	user_service "smct/backend/internal/core/services/user"

	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

type V1 struct {
	UnimplementedV1Server
	resultsService        *result_service.ResultService
	userService           *user_service.UserService
	authenticationService *authentication_service.AuthenticationService
}

func NewV1(
	resultsService *result_service.ResultService,
	userService *user_service.UserService,
	authenticationService *authentication_service.AuthenticationService,
) *V1 {
	return &V1{
		resultsService:        resultsService,
		userService:           userService,
		authenticationService: authenticationService,
	}
}

func (s *V1) UserLogin(ctx context.Context, req *UserLoginRequest) (*UserLoginResponse, error) {
	storedUser, err := s.userService.Get(req.User.Username)
	if err == nil && storedUser.IsEqual(domain.NewUser(req.User.Username, req.User.Password)) {
		s.authenticationService.DeleteToken(storedUser.Username)
		token, err := s.authenticationService.CreateToken(storedUser.Username)
		if err != nil {
			return nil, status.Error(codes.Internal, err.Error())
		}
		return &UserLoginResponse{Token: token.ToString()}, nil
	}
	return nil, status.Error(codes.InvalidArgument, "invalid username or password")
}

func (s *V1) UserRegister(ctx context.Context, req *UserRegisterRequest) (*UserRegisterResponse, error) {
	user, err := s.userService.Create(req.User.Username, req.User.Password)
	if err != nil {
		return nil, status.Error(codes.InvalidArgument, err.Error())
	}
	token, err := s.authenticationService.CreateToken(user.Username)
	if err != nil {
		return nil, status.Error(codes.Internal, err.Error())
	}
	return &UserRegisterResponse{
		Token: token.ToString(),
		User: &User{
			Username: user.Username,
			Password: user.Password,
		},
	}, nil
}

func (s *V1) UserUpdate(ctx context.Context, req *UserUpdateRequest) (*UserUpdateResponse, error) {
	newUser := domain.NewUser(req.NewUser.Username, req.NewUser.Password)
	oldUser := domain.NewUser(req.OldUser.Username, req.OldUser.Password)
	log.Println(1)
	if err := s.userService.Update(newUser, oldUser); err != nil {
		return nil, status.Errorf(codes.Internal, err.Error())
	}

	s.authenticationService.DeleteToken(oldUser.Username)
	token, err := s.authenticationService.CreateToken(newUser.Username)
	if err != nil {
		return nil, status.Errorf(status.Code(err), err.Error())
	}

	for _, tp := range domain.GameType {
		for _, md := range domain.GameMode {
			log.Println(tp, " ", md)
			oldResult, err := s.resultsService.Get(tp, md, oldUser.Username)
			if err != nil {
				continue
			}
			log.Println(oldResult)
			newResult := domain.NewResult(tp, md, oldResult.Scores, newUser.Username, oldResult.Lvl)
			log.Println(newResult)
			s.resultsService.Update(newResult, oldResult)
		}
	}
	return &UserUpdateResponse{Token: token.ToString()}, nil
}

func (s *V1) SaveResult(ctx context.Context, req *ResultSaveRequest) (*ResultSaveResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method SaveResult not implemented")
}

func (s *V1) GetResult(ctx context.Context, req *ResultSaveRequest) (*ResultGetResponse, error) {
	return nil, status.Errorf(codes.Unimplemented, "method GetResult not implemented")
}

func (s *V1) GetResults(req *ResultsGetRequest, resp V1_ResultsGetServer) error {
	return status.Errorf(codes.Unimplemented, "method GetResults not implemented")
}
