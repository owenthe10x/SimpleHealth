package initializers

import "simplehealth/models"

func SyncDatabase() {
	DB.AutoMigrate(&models.User{}, &models.Disease{}, &models.Activity{}, &models.Medicine{})
}