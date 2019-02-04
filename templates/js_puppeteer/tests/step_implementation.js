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

step("Go to Gauge homepage at <query>", async function (query) {
  await page.goto(query);
});

step("Go to Get Started page", async function () {
  await page.click(".cta-primary");
});

step("Show subtitle <title>", async function(title){
  await page.waitFor('.page-header h1');
  const message = await page.$eval('.page-header h1', e => e.innerText);
  assert.strictEqual(message, title);
});