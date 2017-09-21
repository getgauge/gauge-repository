package stepImpl

import (
	"os"
	"strings"

	"github.com/sclevine/agouti"
)

func getDriver() *agouti.WebDriver {
	h := strings.ToLower(os.Getenv("HEADLESS"))
	if h == "y" || h == "true" {
		return agouti.ChromeDriver(agouti.Desired(agouti.Capabilities{
			"chromeOptions": map[string][]string{
				"args": []string{"headless", "disable-gpu", "no-sandbox"},
			},
		}))
	}
	return agouti.ChromeDriver()
}
