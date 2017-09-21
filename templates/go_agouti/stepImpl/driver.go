package stepImpl

import (
	"fmt"

	"github.com/getgauge-contrib/gauge-go/gauge"
	"github.com/getgauge-contrib/gauge-go/testsuit"
	"github.com/sclevine/agouti"
)

var driver *agouti.WebDriver
var page *agouti.Page

func setup() {
	driver = getDriver()
	err := driver.Start()
	if err != nil {
		testsuit.T.Fail(fmt.Errorf("failed to open session: %s/n", err.Error()))
	}
	page, err = driver.NewPage()
	if err != nil {
		testsuit.T.Fail(fmt.Errorf("failed to open page: %s", err.Error()))
	}

}

func cleanup() {
	if err := page.Destroy(); err != nil {
		testsuit.T.Fail(fmt.Errorf("failed to destroy the page: %s", err.Error()))
	}
	if err := driver.Stop(); err != nil {
		testsuit.T.Fail(fmt.Errorf("failed to stop session: %s", err.Error()))
	}
}

var _ = gauge.BeforeSuite(setup, []string{}, testsuit.AND)
var _ = gauge.AfterSuite(cleanup, []string{}, testsuit.AND)
