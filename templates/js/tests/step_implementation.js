/* globals gauge*/
"use strict";
const { openBrowser,write, closeBrowser, goto, press,text, contains } = require('taiko');
const assert = require("assert");
const headless = process.env.headless_chrome.toLowerCase() === 'true';

beforeSuite(async () => {
    await openBrowser({ headless: headless })
});

afterSuite(async () => {
    await closeBrowser();
});

step("Goto Google's search page", async () => {
    await goto('http://google.com');
});

step("Search for <query>", async (query) => {
    await write(query);
    await press('Enter');
});

step("Page contains <content>", async (content) => {
    assert.ok(await text(contains(content)).exists());
});
