/* globals gauge*/
"use strict";
const puppeteer = require('puppeteer');
const assert = require("assert");

var page;
var browser;

beforeSuite(async function () {
  browser = await puppeteer.launch();
  page = await browser.newPage();
});

afterSuite(async function () {
  browser.close();
});

step("Navigate to Gauge homepage <query>", async function (query) {
  await page.goto(query);
});

step("Go to Gauge Get Started Page", async function () {
  await page.click(".link-get-started");
});

step("Display the sub title <title>", async function(title){
  await page.waitFor('.sub-title');
  const message = await page.$eval('.sub-title', e => e.innerText);
  assert.equal(message, title);
});