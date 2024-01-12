package controllers

import (
	"simplehealth/initializers"
	"simplehealth/models"
	"time"

	"github.com/gin-gonic/gin"
	
)

func AddMedicine(c *gin.Context) {
	var body struct {
		UserID      uint      `json:"userId"`
		MedicineName string    `json:"medicineName"`
		Description  string    `json:"description"`
		Quantity     int       `json:"quantity"`
		Consumetime  time.Time `json:"consumetime"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	medicine := models.Medicine{
		UserID:      body.UserID,
		Name:        body.MedicineName,
		Description: body.Description,
		Quantity:    body.Quantity,
		Consumetime: body.Consumetime,
	}
	result := initializers.DB.Create(&medicine)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while creating medicine"})
		return
	}

	c.JSON(200, gin.H{"message": "Medicine created successfully"})
}

func GetMedicines(c *gin.Context) {
	var medicines []models.Medicine
	initializers.DB.Find(&medicines)

	c.JSON(200, gin.H{"medicines": medicines})
}

func DeleteMedicine(c *gin.Context) {
	id := c.Param("id")

	var medicine models.Medicine
	initializers.DB.First(&medicine, id)

	if medicine.ID == 0 {
		c.JSON(404, gin.H{"error": "Medicine not found"})
		return
	}

	initializers.DB.Delete(&medicine)

	c.JSON(200, gin.H{"message": "Medicine deleted successfully"})
}

func UpdateMedicine(c *gin.Context) {
	var body struct {
		MedicineID   uint      `json:"medicineId"`
		MedicineName string    `json:"medicineName"`
		Description  string    `json:"description"`
		Quantity     int       `json:"quantity"`
		Consumetime  time.Time `json:"consumetime"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}
	var medicine models.Medicine
	initializers.DB.First(&medicine, body.MedicineID)

	if medicine.ID == 0 {
		c.JSON(404, gin.H{"error": "Medicine not found"})
		return
	}

	// Update only the fields that are present in the request
	if body.MedicineName != "" {
		medicine.Name = body.MedicineName
	}
	if body.Description != "" {
		medicine.Description = body.Description
	}
	if body.Quantity != 0 {
		medicine.Quantity = body.Quantity
	}
	if !body.Consumetime.IsZero() {
		medicine.Consumetime = body.Consumetime
	}

	initializers.DB.Save(&medicine)

	c.JSON(200, gin.H{"message": "Medicine updated successfully"})
}

func GetMedicineByUser(c *gin.Context) {
	userID := c.Param("userId")

	if userID == "" {
		c.JSON(400, gin.H{"error": "User ID parameter is missing"})
		return
	}

	var medicines []models.Medicine
	result := initializers.DB.Where("user_id = ?", userID).Find(&medicines)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while retrieving medicines"})
		return
	}

	if len(medicines) == 0 {
		c.JSON(404, gin.H{"error": "No medicines found for the specified user"})
		return
	}

	c.JSON(200, gin.H{"medicines": medicines})
}
