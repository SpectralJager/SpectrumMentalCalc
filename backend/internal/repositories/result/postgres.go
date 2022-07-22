package result_repository

import (
	"database/sql"
	"fmt"
	"log"
	"smct/backend/internal/core/domain"
	"strings"

	_ "github.com/lib/pq"
)

type ResultRepository struct {
	db *sql.DB
}

func NewResultRepository(user string, passwd string, db_ip string, db_name string) (*ResultRepository, error) {
	connStr := fmt.Sprintf("postgresql://%v:%v@%v/%v?sslmode=disable", user, passwd, db_ip, db_name)
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		return nil, err
	}
	if err = db.Ping(); err != nil {
		return nil, err
	}
	userRepository := ResultRepository{
		db: db,
	}
	userRepository.createResultTable()
	return &userRepository, nil
}

func (s *ResultRepository) createResultTable() {
	sqlStr := `create table if not exists %s_%s (
		id serial primary key,
		username  text not null unique,
		scores text not null,
		lvl text not null
	);`

	for _, tp := range domain.GameType {
		for _, md := range domain.GameMode {
			tempStr := fmt.Sprintf(sqlStr, strings.ToLower(tp), strings.ToLower(md))
			_, err := s.db.Exec(tempStr)
			if err != nil {
				log.Fatalf("Can't create table %s_%s: %v", strings.ToLower(tp), strings.ToLower(md), err)
			}
		}
	}

}

func (s *ResultRepository) Get(gameType, gameMode, username string) (*domain.Result, error) {
	sqlStr := `select username, scores, lvl from %v_%v where username=$1`
	tempStr := fmt.Sprintf(sqlStr, strings.ToLower(gameType), strings.ToLower(gameMode))
	row := s.db.QueryRow(tempStr, username)
	result := domain.NewResult(gameType, gameMode, "", username, 0)
	err := row.Scan(&result)
	if err != nil {
		return nil, err
	}
	return result, nil
}
func (s *ResultRepository) GetRange(gameType, gameMode string, start, end int) ([]domain.Result, error) {
	results := []domain.Result{}
	sqlStr := fmt.Sprintf(`select username, scores, lvl from %v_%v order by scores desc offset %d limit %d`, strings.ToLower(gameType), strings.ToLower(gameMode), start, end-start)
	rows, err := s.db.Query(sqlStr)
	if err != nil {
		return results, err
	}
	for rows.Next() {
		result := domain.NewResult(gameType, gameMode, "", "", 0)
		if err := rows.Scan(result); err != nil {
			continue
		}
		results = append(results, *result)
	}
	return results, nil

}

func (s *ResultRepository) Save(result *domain.Result) error {
	query := fmt.Sprintf(`insert into %s_%s (username, scores, lvl) values ($1, $2, $3)`, strings.ToLower(result.GameType), strings.ToLower(result.GameMode))
	_, err := s.db.Exec(query, result.Username, result.Scores, result.Lvl)
	return err
}

func (s *ResultRepository) Update(new, old *domain.Result) error {
	query := fmt.Sprintf(`update %s_%s set username=$1, scores=$2, lvl=$3 where username=$4 and scores=$5 and lvl=$6`,
		strings.ToLower(new.GameType),
		strings.ToLower(new.GameMode),
	)
	_, err := s.db.Exec(query, new.Username, new.Scores, new.Lvl, old.Username, old.Scores, old.Lvl)
	return err
}
