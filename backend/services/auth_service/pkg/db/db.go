package db

import (
	"database/sql"
	"fmt"
	"log"

	_ "github.com/lib/pq"
)

func CreateConnection(user string, passwd string, db_ip string) (db *sql.DB, err error) {
	connStr := fmt.Sprintf("postgresql://%v:%v@%v/mentalCalc?sslmode=disable", user, passwd, db_ip)
	db, err = sql.Open("postgres", connStr)
	if err != nil {
		log.Printf("Can't open database. Check input values:\n %v ", err)
		return
	}
	if err = db.Ping(); err != nil {
		log.Printf("Can't ping database:\n %v ", err)
		return
	}
	return
}
