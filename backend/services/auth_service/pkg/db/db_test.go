package db_test

import (
	"database/sql"
	"testing"

	"github.com/SpectralJager/SpectrumMentalCalc/backend/pkg/config"
	"github.com/SpectralJager/SpectrumMentalCalc/backend/pkg/db"
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
		database_conf["database"].(string),
	)
	if err != nil {
		t.Fatalf(err.Error())
	}
}
