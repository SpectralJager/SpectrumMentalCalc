package authorization_service

import (
	"errors"
	"smct/backend/internal/core/domain"
	authentication_service "smct/backend/internal/core/services/authentication"
	user_service "smct/backend/internal/core/services/user"
)

type AuthorizationService struct {
	authenticationService authentication_service.AuthenticationService
	userService           user_service.UserService
}

func (s *AuthorizationService) Login(username, password string) (*domain.Token, error) {
	storedUser, err := s.userService.Get(username)
	if err != nil {
		return nil, err
	}
	if storedUser.IsEqual(domain.NewUser(username, password)) {
		s.authenticationService.DeleteToken(storedUser.Username)
		token, err := s.authenticationService.CreateToken(storedUser.Username)
		if err != nil {
			return nil, err
		}
		return token, err
	}
	return nil, errors.New("wrong username or password")
}

func (s *AuthorizationService) Register(username, password string) (*domain.Token, error) {
	user, err := s.userService.Create(username, password)
	if err != nil {
		return nil, err
	}
	token, err := s.authenticationService.CreateToken(user.Username)
	if err != nil {
		return nil, err
	}
	return token, nil
}

func (s *AuthorizationService) Logout(user *domain.User) error {
	return errors.New("unimplemented")
}
func (s *AuthorizationService) Delete(user *domain.User) error {
	return errors.New("unimplemented")
}
