package user_repository

import (
	"database/sql"
	"fmt"
	"log"
	"smct/backend/internal/core/domain"

	_ "github.com/lib/pq"
)

type UserRepository struct {
	db *sql.DB
}

func NewUserRepository(user string, passwd string, db_ip string, db_name string) (*UserRepository, error) {
	connStr := fmt.Sprintf("postgresql://%v:%v@%v/%v?sslmode=disable", user, passwd, db_ip, db_name)
	db, err := sql.Open("postgres", connStr)
	if err != nil {
		return nil, err
	}
	if err = db.Ping(); err != nil {
		return nil, err
	}
	userRepository := UserRepository{
		db: db,
	}
	userRepository.createUserTable()
	return &userRepository, nil
}

func (s *UserRepository) createUserTable() {
	sqlStr := `create table if not exists users (
		id serial primary key,
		username  text not null unique,
		password  text not null
	);`
	_, err := s.db.Exec(sqlStr)
	if err != nil {
		log.Fatalf("Can't create table users: %v", err)
	}
}

func (s *UserRepository) Get(username string) (*domain.User, error) {
	sqlStr := `select username, password from users where username=$1`
	row := s.db.QueryRow(sqlStr, username)
	user := domain.User{}
	err := row.Scan(&user)
	if err != nil {
		return nil, err
	}
	return &user, nil
}

func (s *UserRepository) Save(user *domain.User) error {
	query := `insert into users (username, password) values ($1, $2)`
	_, err := s.db.Exec(query, user.Username, user.Password)
	return err
}

func (s *UserRepository) Update(new, old *domain.User) error {
	query := `update users set username=$1, password=$2 where username=$3 and password=$4`
	_, err := s.db.Exec(query, new.Username, new.Password, old.Username, old.Password)
	return err
}

func (s *UserRepository) Delete(user *domain.User) error {
	query := `delete from users where username=$1 and password=$2`
	_, err := s.db.Exec(query, user.Username, user.Password)
	return err
}
