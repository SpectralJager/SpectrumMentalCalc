package db

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

func CreateConnection(user string, passwd string, db_ip string, db_name string) (db *sql.DB, err error) {
	connStr := fmt.Sprintf("postgresql://%v:%v@%v/%v?sslmode=disable", user, passwd, db_ip, db_name)
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Printf("Can't open database. Check input values:\n %v ", err)
		return
	}
	if err = db.Ping(); err != nil {
		log.Printf("Can't ping database:\n %v ", err)
		return
	}
	createUserTable(db)
	return
}

func createUserTable(db *sql.DB) {
	sqlStr := `create table if not exists users (
		id serial primary key,
		username  text not null unique,
		password  text not null
	);`
	_, err := db.Exec(sqlStr)
	if err != nil {
		log.Fatalf("Can't create table users: %v", err)
	}
}
