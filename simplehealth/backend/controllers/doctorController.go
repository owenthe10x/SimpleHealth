package controllers

import (
	"simplehealth/initializers"
	"simplehealth/models"
	"time"

	"github.com/gin-gonic/gin"

)

func AddDoctor(c *gin.Context) {
	var body struct {
		Email          string  `json:"email"`
		Password       string  `json:"password"`
		Name           string  `json:"name"`
		Specialization string  `json:"specialization"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	doctor := models.Doctor{
		Email:          body.Email,
		Password:       body.Password,
		Name:           body.Name,
		Specialization: body.Specialization,
		Customernum:   0,
		Rating:         0,
		CreatedAt:      time.Now(),
	}
	result := initializers.DB.Create(&doctor)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while creating doctor"})
		return
	}

	c.JSON(200, gin.H{"message": "Doctor created successfully"})
}

func GetDoctors(c *gin.Context) {
	var doctors []models.Doctor
	initializers.DB.Find(&doctors)

	c.JSON(200, gin.H{"doctors": doctors})
}

func DeleteDoctor(c *gin.Context) {
	id := c.Param("id")

	var doctor models.Doctor
	initializers.DB.First(&doctor, id)

	if doctor.ID == 0 {
		c.JSON(404, gin.H{"error": "Doctor not found"})
		return
	}

	initializers.DB.Delete(&doctor)

	c.JSON(200, gin.H{"message": "Doctor deleted successfully"})
}

func UpdateDoctor(c *gin.Context) {

	id := c.Param("id")
	var body struct {
		Email          string  `json:"email"`
		Password       string  `json:"password"`
		Name           string  `json:"name"`
		Specialization string  `json:"specialization"`
		Customernum    int64   `json:"customernum"`
		Rating         float64 `json:"rating"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}
	var doctor models.Doctor
	initializers.DB.First(&doctor, id)

	if doctor.ID == 0 {
		c.JSON(404, gin.H{"error": "Doctor not found"})
		return
	}

	// Update only the fields that are present in the request
	if body.Email != "" {
		doctor.Email = body.Email
	}
	if body.Password != "" {
		doctor.Password = body.Password
	}
	if body.Name != "" {
		doctor.Name = body.Name
	}
	if body.Specialization != "" {
		doctor.Specialization = body.Specialization
	}
	if body.Customernum != 0 {
		doctor.Customernum = body.Customernum
	}
	if body.Rating != 0 {
		doctor.Rating = body.Rating
	}

	initializers.DB.Save(&doctor)

	c.JSON(200, gin.H{"message": "Doctor updated successfully"})
}

func GetDoctorBySpecialization(c *gin.Context) {
	specialization := c.Param("specialization")

	if specialization == "" {
		c.JSON(400, gin.H{"error": "Specialization parameter is missing"})
		return
	}

	var doctors []models.Doctor
	result := initializers.DB.Where("specialization = ?", specialization).Find(&doctors)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while retrieving doctors"})
		return
	}

	if len(doctors) == 0 {
		c.JSON(404, gin.H{"error": "No doctors found for the specified specialization"})
		return
	}

	c.JSON(200, gin.H{"doctors": doctors})
}