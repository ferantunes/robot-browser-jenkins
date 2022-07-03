*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Page    https://playwright.dev
    Browser.Take Screenshot
    Get Text    h1    contains    Playwright