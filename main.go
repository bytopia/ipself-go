package main

import (
	"github.com/gin-gonic/gin"
	"log"
)

func main() {

	r := gin.Default()
	r.GET("/", func(c *gin.Context) {
		ip := c.ClientIP()
		c.String(200, ip)
	})

	if err := r.Run(":80"); err != nil {
		log.Fatalf("server run error: %+v", err)
	}
}
