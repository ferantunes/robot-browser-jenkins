*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Page    https://playwright.dev
    Get Browser Catalog
    Get Browser Ids
    Take Screenshot    fullPage=True
    Get Text    h1    contains    Playwright