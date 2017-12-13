/* globals gauge*/
"use strict";
const { openBrowser, closeBrowser, goto, click, text } = require('taiko');
const assert = require("assert");

beforeSuite(async () => openBrowser());

afterSuite(async () => closeBrowser());

step("Go to Gauge homepage at <query>", async query => goto(query));

step("Go to Get Started page", async () => click("Get Started"));

step("Show subtitle <title>", async title => assert.ok(await text(title).exists()));