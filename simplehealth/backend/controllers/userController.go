package controllers

import (
	"net/http"
	"os"
	"simplehealth/initializers"
	"simplehealth/models"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
	"golang.org/x/crypto/bcrypt"
)

func Signup(c *gin.Context) {
	var body struct {
		Email    string `json:"email"`
		Password string `json:"password"`
		Name     string `json:"name"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(body.Password), bcrypt.DefaultCost)

	if err != nil {
		c.JSON(500, gin.H{"error": "Error while hashing password"})
		return
	}

	// Get the current time
	currentTime := time.Now()

	user := models.User{
		Email:     body.Email,
		Password:  string(hash),
		Name:      body.Name,
		CreatedAt: currentTime,
		Disease: []models.Disease{},
		Activity: []models.Activity{},
		Medicine: []models.Medicine{},
	}
	result := initializers.DB.Create(&user)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while creating user"})}

	c.JSON(200, gin.H{"message": "User created successfully"})
}

func Login(c *gin.Context){
	var body struct {
		Email    string `json:"email"`
		Password string `json:"password"`
	}

	if c.BindJSON(&body) != nil {
		c.JSON(400, gin.H{"error": "Fields are not valid"})
		return
	}

	var user models.User

	result := initializers.DB.Where("email = ?", body.Email).First(&user)

	if result.Error != nil {
		c.JSON(500, gin.H{"error": "Error while finding user"})
		return
	}

	if user.ID == 0 {
		c.JSON(401, gin.H{"error": "User not found"})
		return
	}

	if err := bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(body.Password)); err != nil {
		c.JSON(401, gin.H{"error": "Invalid password"})
		return
	}


	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"sub": user.ID,
		"exp": time.Now().Add(time.Hour * 24 * 30).Unix(),
	})

	tokenString, err := token.SignedString([]byte(os.Getenv("JWT_SECRET")))
	if err != nil {
		c.JSON(500, gin.H{"error": "Error while generating token"})
	}
	c.SetSameSite(http.SameSiteLaxMode)
	c.SetCookie("Authorization", tokenString, 60*60*24*30, "/", "localhost", true, true)

	c.JSON(200, gin.H{"message": "Login successful"})
}

func Logout(c *gin.Context) {
	c.SetSameSite(http.SameSiteLaxMode)
	c.SetCookie("Authorization", "", -1, "/", "localhost", true, true)
	c.JSON(200, gin.H{"message": "Logout successful"})
}

func GetCurrentUser(c *gin.Context) {
	user, _ := c.Get("user")

	if user == nil {
		c.JSON(200, gin.H{"user": nil})
		return
	}

	c.JSON(200, gin.H{"user": user})
}

func Validate(c *gin.Context) {
	user, _ := c.Get("user")

	if user == nil {
		c.JSON(401, gin.H{"error": "Unauthorized"})
		return
	}

	c.JSON(200, gin.H{"message": user})
}