*** Settings ***
Library   Browser

*** Test Cases ***
Teste 01
    Log Variables
    # New Browser    ${BROWSER}
    New Page    https://playwright.dev
    Get Browser Catalog
    Get Browser Ids
    Take Screenshot    fullPage=True
    Get Text    h1    contains    Playwright
    # Click    css=a.getStarted_Sjon
    # Get Text    css=header h1    equal    Installation
    # Mouse Move Relative To    css=div.navbar__items:first-child div:nth-child(6)
    # Mouse Move Relative To    css=div.navbar__items:first-child div:nth-child(6) a[href="/docs/intro"]
    # Wait For Elements State    css=div.navbar__items:first-child div:nth-child(6) a[href="/docs/intro"]
    # Click    css=div.navbar__items:first-child div:nth-child(6) a[href="/python/docs/intro"]
    # Get Text    css=h3[id="pip"]    contains    Pip
    Take Screenshot    fullPage=True

Teste 02
    IF    ${BROWSER} == webkit
        Log    False
    ELSE
        Log Variables
        New Page    https://playwright.dev
        Get Browser Catalog
        Get Browser Ids
        Take Screenshot    fullPage=True
        Get Text    h1    contains    Playwright
        Take Screenshot    fullPage=True        
    END


Teste 03
    Log Variables
    New Page    https://playwright.dev
    Get Browser Catalog
    Get Browser Ids
    Take Screenshot    fullPage=True
    Get Text    h1    contains    Playwright
    Take Screenshot    fullPage=True