*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${BROWSER} =  firefox
${MIN_PRICE} =  175

*** Test Cases ***

Price check for ryzen
  Set Selenium Speed  3
  Open Browser  http://www.verkkokauppa.com  ${BROWSER}
  Input Text  xpath=/html/body/div[1]/div[1]/header/div/nav/form/div/input  amd ryzen 5 3600
  Click Button  xpath=/html/body/div[1]/div[1]/header/div/nav/form/div/div/button[2]
  Click Button  id=allow-cookies
  Click Element  xpath=/html/body/div[1]/div[1]/div/div/main/div/div[6]/div/ol/li[1]/div/div[1]/div/a
  Wait Until Page Contains  Esittely
   
  ${PRICE} =  Get Element Attribute  xpath=/html/body/div[1]/div[1]/div/div/main/section/aside/div[2]/div[1]/div[2]/div[1]/span/data  value
  Log  ${PRICE}
  ${OK} =  Evaluate  ${PRICE} > ${MIN_PRICE}
  Should Be True  ${OK}
  Close Browser
