package stepImpl

import (
	"fmt"

	. "github.com/getgauge-contrib/gauge-go/gauge"
	"github.com/getgauge-contrib/gauge-go/testsuit"
)

var _ = Step("Navigate to Gauge homepage <url>", func(url string) {
	err := page.Navigate(url)
	if err != nil {
		testsuit.T.Fail(fmt.Errorf("failed to browse url %s: %s", url, err.Error()))
	}
})

var _ = Step("Go to Gauge Get Started Page", func() {
	err := page.FindByClass("link-get-started").Click()
	if err != nil {
		testsuit.T.Fail(fmt.Errorf("hold on! couldn't get started: %s", err.Error()))
	}
})
