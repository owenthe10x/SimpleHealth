package middleware

import (
	"fmt"
	"net/http"
	"os"
	"simplehealth/initializers"
	"simplehealth/models"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/golang-jwt/jwt/v4"
)

func RequireAuth(c *gin.Context) {
	tokenString, err := c.Cookie("Authorization")
	
	if err != nil {
		c.AbortWithStatus(http.StatusUnauthorized)}

	token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
		if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok{
			return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
		}

		return []byte(os.Getenv("JWT_SECRET")), nil
	})

	if err != nil {
		c.AbortWithStatus(http.StatusUnauthorized)
	}

	currenttime := time.Now().Unix()
	if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
		if claims["exp"].(float64) < float64(currenttime) {
			c.AbortWithStatus(http.StatusUnauthorized)
		}
		var user models.User
		initializers.DB.First(&user, claims["sub"])

		if user.ID == 0 {
			c.AbortWithStatus(http.StatusUnauthorized)
		}
		c.Set("user", user)
		c.Next()
	}else{
		c.AbortWithStatus(http.StatusUnauthorized)
	}

	
	
}
