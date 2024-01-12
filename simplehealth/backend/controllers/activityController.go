package controllers

import (
	"simplehealth/initializers"
	"simplehealth/models"
	"time"
	"github.com/gin-gonic/gin"
	
)

func AddActivity(c *gin.Context) {
	var body struct {
		UserID	uint `json:"userId"`
		ActivityName string `json:"activityname"`
		Startdate time.Time `json:"startdate"`
		Enddate time.Time `json:"enddate"`
		Description string `json:"description"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	activity := models.Activity{
		UserID: body.UserID,
		Name: body.ActivityName,
		Startdate: body.Startdate,
		Enddate: body.Enddate,
		Description: body.Description,
	}
	result := initializers.DB.Create(&activity)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while creating activity"})}

	c.JSON(200, gin.H{"message": "Activity created successfully"})
}

func GetActivities(c *gin.Context) {
	var activities []models.Activity
	initializers.DB.Find(&activities)

	c.JSON(200, gin.H{"activities": activities})
}

func DeleteActivity(c *gin.Context) {
	
	id := c.Param("id")

	var activity models.Activity
	initializers.DB.First(&activity, id)

	if activity.ID == 0 {
		c.JSON(404, gin.H{"error": "Activity not found"})
		return
	}

	initializers.DB.Delete(&activity)

	c.JSON(200, gin.H{"message": "Activity deleted successfully"})
}

func UpdateActivity(c *gin.Context) {

	id := c.Param("id")	
	var body struct {
		ActivityName string `json:"activityname"`
		Startdate time.Time `json:"startdate"`
		Enddate time.Time `json:"enddate"`
		Description string `json:"description"`
	}


	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}
	var activity models.Activity
	initializers.DB.First(&activity, id)

	if activity.ID == 0 {
		c.JSON(404, gin.H{"error": "Activity not found"})
		return
	}

	activity.Name = body.ActivityName
	activity.Startdate = body.Startdate
	activity.Enddate = body.Enddate
	activity.Description = body.Description

	initializers.DB.Save(&activity)

	c.JSON(200, gin.H{"message": "Activity updated successfully"})
}