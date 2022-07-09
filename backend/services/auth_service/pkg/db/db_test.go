package db_test

import (
	"database/sql"
	"testing"

	"unknspectrum.tech/mental_calc/auth/pkg/config"
	"unknspectrum.tech/mental_calc/auth/pkg/db"
)

var database *sql.DB

func TestCreateConnnection(t *testing.T) {
	config, err := config.GetConfig("../../config.yaml")
	if err != nil {
		t.Fatalf(err.Error())
	}
	database_conf := config["db"].(map[string]interface{})
	database, err = db.CreateConnection(
		database_conf["username"].(string),
		database_conf["password"].(string),
		database_conf["database_ip"].(string),
	)
	if err != nil {
		t.Fatalf(err.Error())
	}
}
