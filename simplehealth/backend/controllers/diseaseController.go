package controllers

import (
	"simplehealth/initializers"
	"simplehealth/models"

	"github.com/gin-gonic/gin"
)

func AddDisease(c *gin.Context) {
	var body struct {
		UserID      uint   `json:"userId"`
		DiseaseName string `json:"diseaseName"`
		Description string `json:"description"`
		Startdate    string `json:"startdate"`
		Enddate      string `json:"enddate"`
		Status       bool   `json:"status"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	disease := models.Disease{
		UserID:      body.UserID,
		Name:        body.DiseaseName,
		Description: body.Description,
		Startdate:   body.Startdate,
		Enddate:     body.Enddate,
		Status:      body.Status,
	}
	result := initializers.DB.Create(&disease)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while creating disease"})
		return
	}

	c.JSON(200, gin.H{"message": "Disease created successfully"})
}

func GetDiseases(c *gin.Context) {
	// Retrieve the userId from the cookie
	user, _ := c.Get("user")
	
	if user == nil {
		c.JSON(400, gin.H{"error": "User ID not found in cookies"})
		return
	}

	var diseases []models.Disease
	initializers.DB.Where("user_id = ?", user.(models.User).ID).Find(&diseases)

	c.JSON(200, gin.H{"diseases": diseases})
}

func DeleteDisease(c *gin.Context) {
	diseaseID := c.Param("id")


	var disease models.Disease
	initializers.DB.First(&disease, diseaseID)

	if disease.ID == 0 {
		c.JSON(404, gin.H{"error": "Disease not found"})
		return
	}

	initializers.DB.Delete(&disease)

	c.JSON(200, gin.H{"message": "Disease deleted successfully"})
}

func UpdateDisease(c *gin.Context) {
	id := c.Param("id")
	var body struct {
		DiseaseName string `json:"diseaseName"`
		Description string `json:"description"`
		Startdate    string `json:"startdate"`
		Enddate      string `json:"enddate"`
		Status       bool   `json:"status"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}
	var disease models.Disease
	initializers.DB.First(&disease, id )

	if disease.ID == 0 {
		c.JSON(404, gin.H{"error": "Disease not found"})
		return
	}

	// Update only the fields that are present in the request
	if body.DiseaseName != "" {
		disease.Name = body.DiseaseName
	}
	if body.Description != "" {
		disease.Description = body.Description
	}
	if body.Startdate != "" {
		disease.Startdate = body.Startdate
	}
	if body.Enddate != "" {
		disease.Enddate = body.Enddate
	}
	disease.Status = body.Status

	initializers.DB.Save(&disease)

	c.JSON(200, gin.H{"message": "Disease updated successfully"})
}
