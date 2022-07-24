package result_service

import (
	"smct/backend/internal/core/domain"
	"smct/backend/internal/core/ports"
)

type ResultService struct {
	resultRepository ports.ResultRepository
}

func NewResultService(resRep ports.ResultRepository) *ResultService {
	return &ResultService{
		resultRepository: resRep,
	}
}

func (s *ResultService) Create(gameType, gameMode, scores, username string, lvl int) (*domain.Result, error) {
	result := domain.NewResult(gameType, gameMode, scores, username, lvl)
	err := s.resultRepository.Save(result)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (s *ResultService) Update(newResult, oldResult *domain.Result) error {
	return s.resultRepository.Update(newResult, oldResult)
}

func (s *ResultService) Get(gameType, gameMode, username string) (*domain.Result, error) {
	result, err := s.resultRepository.Get(gameType, gameMode, username)
	if err != nil {
		return nil, err
	}
	return result, nil
}

func (s *ResultService) GetRange(gameType, gameMode string, start, end int) ([]domain.Result, error) {
	results, err := s.resultRepository.GetRange(gameType, gameMode, start, end)
	if err != nil {
		return []domain.Result{}, err
	}
	return results, nil
}
