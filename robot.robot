*** Settings ***
Library   Selenium2Library

Test Setup     Uruchomienie przegladarki ze strona Zalando
Test Teardown  Zamkniecie przegladarki


*** Variables ***

${BROWSER}   Chrome
${IKONA_ZALOGUJ_SIE}    css=.z-navicat-header_navToolItem-profile
${LOGIN_URL}   https://www.zalando.pl/kobiety-home/
${UZYTKOWNIK}     abcd@abcde.pl.test
${BLEDNY_LOGIN}   abcd@abcde.pl.test.test
${HASLO}   testowanie
${POLE_LOGIN}  css=input[name='login.email']
${POLE_HASLO}   css=input[name='login.password']
${PRZYCISK_ZALOGUJ_SIE}   css=button.z-button.z-coast-reef_login_button.z-button--primary.z-button--button
${WITAJ_TESTER}   Witaj Tester
${COS_POSZLO_NIE_TAK}   Coś poszło nie tak.
${POMOC I KONTAKT}   css=span.z-navicat-header-uspBar_message-split_styled:nth-child(1) > a:nth-child(1)
${POKAZ MOJE ZAMOWIENIA}   css=.intro__link--orders
${MOJE ZAMOWIENIA}   Moje zamówienia
${POZYCJA_TOWAROWA}   css=a[href$='11.html']
${ZALANDO}     css=img.z-navicat-header_svgLogo
${DODAJ_DO_LISTY_ZYCZEN}   css=#z-pdp-topSection-addToWishlistButton
${CZERWONE_SERCE}   css=.h-icon-heart_filled
${REGULAMIN}   css=a.z-navigation-footer_subFooterLink:nth-child(3)
${REGULAMIN_DLA_ZAMOWIEN}   Regulamin dla zamówień za pośrednictwem www.zalando.pl
${MENU_MOJE_KONTO}  css=#looneytunes-user-account nav
${TWOJE_ULUBIONE_MARKI}   Twoje ulubione marki

*** Test Cases ***

Logowanie z uzyciem prawidlowych danych do logowania
    [Tags]  Krytyczny
    Klikniecie ikonki Zaloguj
    Wprowadzenie nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Klikniecie przycisku logowania
    Weryfikacja czy logowanie sie powiodlo


Logowanie z uzyciem nieprawidlowej nazwy uzytkownika
    [Tags]  Krytyczny
    Klikniecie ikonki Zaloguj
    Wprowadzenie blednej nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Klikniecie przycisku logowania
    Weryfikacja czy logowanie sie nie powiodlo

Wyswietlenie pozycji menu z Moje Konto
    [Tags]  Niski
    Klikniecie ikonki Zaloguj
    Wprowadzenie nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    Klikniecie przycisku logowania
    Sprawdzenie czy menu Moje Konto zawiera tekst "Twoje ulubione marki"

Dodawanie produktu do listy zyczen
    [Tags]  Wysoki
    Klikniecie ikonki Zaloguj
    Wprowadzenie nazwy uzytkownika
    Wprowadzenie hasla do konta uzytkownika
    KLikniecie przycisku logowania
    Klikniecie logo Zalando - przejscie na strone glowna
    Klikniecie w jakikolwiek produkt
    Klikniecie dodaj do listy zyczen
    Capture Page Screenshot
    Sprawdzenie czy towar znajduje sie na liscie zyczen
    Klikniecie dodaj do listy zyczen  # ponowne klikniecie powoduje usuniecie z listy zyczen

Sprawdzenie czy sklep posiada regulamin zakupow
    [Tags]  Krytyczny
    Klikniecie w regulamin
    Weryfikacja czy strona z regulaminem sie wyswietla


*** Keywords ***


Uruchomienie przegladarki ze strona Zalando
      Open browser     ${LOGIN_URL}    ${BROWSER}

Klikniecie ikonki Zaloguj
      Wait until element is visible  ${IKONA_ZALOGUJ_SIE}
      Click Element  ${IKONA_ZALOGUJ_SIE}

Wprowadzenie nazwy uzytkownika
      Wait until element is visible  ${POLE_LOGIN}
      sleep    1
      Input Text     ${POLE_LOGIN}   ${UZYTKOWNIK}

Klikniecie przycisku pomoc i kontakt
      Wait until element is visible  ${POMOC I KONTAKT}
      Click Element   ${POMOC I KONTAKT}

Klikniecie w pokaz moje zamowienia
      sleep   1
      Click Element   ${POKAZ MOJE ZAMOWIENIA}

Sprawdzenie czy wyswietlila sie strona z zamowieniami
      Page should contain   ${MOJE ZAMOWIENIA}

Wprowadzenie blednej nazwy uzytkownika
      Wait until element is visible  ${POLE_LOGIN}
      sleep    1
      Input Text     ${POLE_LOGIN}   ${BLEDNY_LOGIN}

Wprowadzenie hasla do konta uzytkownika
      Input Text   ${POLE_HASLO}    ${HASLO}

Klikniecie przycisku logowania
      Click Button    ${PRZYCISK_ZALOGUJ_SIE}

Weryfikacja czy logowanie sie powiodlo
      Wait until page contains   ${Witaj Tester}

Weryfikacja czy logowanie sie nie powiodlo
      Wait until page contains   ${COS_POSZLO_NIE_TAK}

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

Klikniecie w regulamin
      Click element   ${REGULAMIN}

Weryfikacja czy strona z regulaminem sie wyswietla
      Page should contain   ${REGULAMIN_DLA_ZAMOWIEN}

Zamkniecie przegladarki
      Capture Page Screenshot
      Close All Browsers

Sprawdzenie czy menu Moje Konto zawiera tekst "Twoje ulubione marki"
      Wait Until Element Contains   ${MENU_MOJE_KONTO}  ${TWOJE_ULUBIONE_MARKI}

