package authentication_service

import (
	"errors"
	"smct/backend/internal/core/domain"
	"smct/backend/internal/core/ports"
)

type AuthenticationService struct {
	tokenRepository ports.TokenRepository
}

func (s *AuthenticationService) CreateToken(username string) (*domain.Token, error) {
	token := domain.NewToken(username)
	err := s.tokenRepository.Save(token)
	if err != nil {
		return nil, err
	}
	return token, nil
}

func (s *AuthenticationService) GetToken(username string) (*domain.Token, error) {
	token, err := s.tokenRepository.Get(username)
	if err != nil {
		return nil, err
	}
	return token, nil
}
func (s *AuthenticationService) CheckToken(username string, token *domain.Token) (bool, error) {
	storedToken, err := s.tokenRepository.Get(username)
	if err != nil {
		return false, err
	}
	if storedToken != token {
		return false, errors.New("wrong token, access denied")
	}
	return true, nil
}
func (s *AuthenticationService) DeleteToken(username string, token *domain.Token) error {
	err := s.tokenRepository.Delete(username, token)
	return err
}
