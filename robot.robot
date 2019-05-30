*** Settings ***
Library   Selenium2Library


*** Variables ***

${BROWSER}   Firefox
${ZALOGUJ}    css=.z-navicat-header_navToolItem-profile
${LOGIN_URL}   https://www.zalando.pl/kobiety-home/
${UZYTKOWNIK}   abcd@abcde.pl.test
${HASLO}   testowanie
${POLE_LOGIN}  css=input[name='login.email']
${POLE_HASLO}   css=input[name='login.password']
${PRZYCISK}   css=button.z-button.z-coast-reef_login_button.z-button--primary.z-button--button
${WITAJ_TESTER}   Witaj Tester
${BLEDNY_LOGIN}   tester
${STYLIZACJE}   css=.z-navicat-header_categoryListLinkText
${POMYSLY_NA_STYLIZACJE}   Pomysły na stylizacje
${POZYCJA_TOWAROWA}   css=a[href$='11.html']
${ZALANDO}     css=img.z-navicat-header_svgLogo
${DODAJ_DO_LISTY_ZYCZEN}   css=#z-pdp-topSection-addToWishlistButton
${CZERWONE_SERCE}   css=.h-icon-heart_filled
${REGULAMIN}   css=a.z-navigation-footer_subFooterLink:nth-child(3)
${REGULAMIN_DLA_ZAMOWIEN}   Regulamin dla zamówień za pośrednictwem www.zalando.pl

*** Test Cases ***

Logowanie z uzyciem prawidlowych danych do logowania
    Uruchomienie przegladarki ze strona Zalando
    Klikniecie przycisku Zaloguj
    Wprowadzenie nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Wcisniecie przycisku logowania
    Weryfikacja czy logowanie sie powiodlo
    Zamkniecie przegladarki

Wyswietlenie przedmiotow w stylu klasycznym z kategorii Stylizacje
    Uruchomienie przegladarki ze strona Zalando
    Klikniecie w pasku nawigacji w Stylizacje
    Weryfikacja czy strona ze stylizacjami sie wyswietla
    Zamkniecie przegladarki

Logowanie z uzyciem nieprawidlowej nazwy uzytkownika
    Uruchomienie przegladarki ze strona Zalando
    Klikniecie przycisku Zaloguj
    Wprowadzenie blednej nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Wcisniecie przycisku logowania
    Zamkniecie przegladarki

Dodawanie produktu do listy zyczen
    Uruchomienie przegladarki ze strona Zalando
    Klikniecie przycisku Zaloguj
    Wprowadzenie nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Wcisniecie przycisku logowania
    Klikniecie logo Zalando - przejscie na strone glowna
    Klikniecie w jakikolwiek produkt
    Klikniecie dodaj do listy zyczen
    Sprawdzenie czy towar znajduje sie na liscie zyczen
    Klikniecie dodaj do listy zyczen  # ponowne klikniecie powoduje usuniecie z listy zyczen
    Zamkniecie przegladarki

Sprawdzenie czy sklep posiada regulamin zakupow
    Uruchomienie przegladarki ze strona Zalando
    Klikniecie w regulamin
    Weryfikacja czy strona z regulaminem sie wyswietla
    Zamkniecie przegladarki


*** Keywords ***


Uruchomienie przegladarki ze strona Zalando
      Open browser     ${LOGIN_URL}    ${BROWSER}

Klikniecie przycisku Zaloguj
      Wait until element is visible  ${ZALOGUJ}
      Click Element  ${ZALOGUJ}

Wprowadzenie nazwy uzytkownika
      Wait until element is visible  ${POLE_LOGIN}
      sleep    1
      Input Text     ${POLE_LOGIN}   ${UZYTKOWNIK}

Wprowadzenie blednej nazwy uzytkownika
      Wait until element is visible  ${POLE_LOGIN}
      sleep    1
      Input Text     ${POLE_LOGIN}   ${BLEDNY_LOGIN}

Wprowadzenie hasla do konta uzytkownika
      Input Text   ${POLE_HASLO}    ${HASLO}

Wcisniecie przycisku logowania
      Click Button    ${PRZYCISK}

Weryfikacja czy logowanie sie powiodlo
      Wait until page contains   ${Witaj Tester}
      Capture Page Screenshot

Klikniecie w pasku nawigacji w Stylizacje
      Wait until element is visible   ${STYLIZACJE}
      sleep   1
      Click Element   ${STYLIZACJE}

Weryfikacja czy strona ze stylizacjami sie wyswietla
      Wait until page contains   ${POMYSLY NA STYLIZACJE}
      Capture Page Screenshot

Klikniecie w jakikolwiek produkt
      Click Element   ${POZYCJA_TOWAROWA}
      Sleep   1

Klikniecie logo Zalando - przejscie na strone glowna
      Sleep    5
      Click Element   ${ZALANDO}

Klikniecie dodaj do listy zyczen
      Click Button   ${DODAJ_DO_LISTY_ZYCZEN}
      Sleep   1

Sprawdzenie czy towar znajduje sie na liscie zyczen
      Page should contain element  ${CZERWONE_SERCE}
      Capture Page Screenshot

Klikniecie w regulamin
      Click element   ${REGULAMIN}

Weryfikacja czy strona z regulaminem sie wyswietla
      Page should contain   ${REGULAMIN_DLA_ZAMOWIEN}
      Capture Page Screenshot

Zamkniecie przegladarki
      Close All Browsers