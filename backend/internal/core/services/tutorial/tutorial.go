package tutorial_service

import (
	"smct/backend/internal/core/domain"
	"smct/backend/internal/core/ports"
)

type TutorialService struct {
	tutorialRepository ports.TutorialRepository
}

func (s *TutorialService) Get(gameType, gameMode, title string) (*domain.Tutorial, error) {
	tutorial, err := s.tutorialRepository.Get(gameType, gameMode, title)
	if err != nil {
		return nil, err
	}
	return tutorial, nil
}

func (s *TutorialService) GetTitles(gameType, gameMode string) ([]string, error) {
	titles, err := s.tutorialRepository.GetTitles(gameType, gameMode)
	if err != nil {
		return nil, err
	}
	return titles, nil
}
