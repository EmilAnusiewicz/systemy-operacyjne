#!/bin/bash

PLIK="baza.txt"

touch "$PLIK"

# wyszukiwanie przez parametr
if [ $# -gt 0 ]
then
    PARAMETR="$1"

    KLUCZ=$(echo "$PARAMETR" | cut -d= -f1)
    WARTOSC=$(echo "$PARAMETR" | cut -d= -f2 | tr -d '"')

    grep -i "$WARTOSC" "$PLIK"

    exit 0
fi

while true
do
    echo
    echo "----- BAZA DANYCH -----"
    echo "1 - Wstaw rekord"
    echo "2 - Wyszukaj rekord"
    echo "3 - Aktualizuj rekord"
    echo "4 - Usuń rekord"
    echo "5 - Pokaż bazę"
    echo "6 - Koniec"

    echo -n "Wybierz opcję: "
    read OPCJA

    case $OPCJA in

    1)
        echo
        echo "Podaj rekord:"
        echo "Imię i nazwisko | Miejscowość | Numer telefonu"

        read REKORD

        echo "$REKORD" | grep "|" > /dev/null

        if [ $? -ne 0 ]
        then
            echo "Błędny format rekordu"
            continue
        fi

        IMIE=$(echo "$REKORD" | cut -d"|" -f1)

        grep -i "^$IMIE" "$PLIK" > /dev/null

        if [ $? -eq 0 ]
        then
            echo "Rekord już istnieje"
            continue
        fi

        echo "$REKORD" >> "$PLIK"

        echo "$IMIE został dodany do bazy danych"
        ;;

    2)
        echo
        echo 'Podaj parametr wyszukiwania'
        echo 'np. imie="Jan Kowalski"'
        echo 'lub miejscowosc="Warszawa"'
        echo 'lub telefon="22 742 30 21"'

        read PARAMETR

        WARTOSC=$(echo "$PARAMETR" | cut -d= -f2 | tr -d '"')

        WYNIK=$(grep -i "$WARTOSC" "$PLIK")

        if [ -z "$WYNIK" ]
        then
            echo "Nie znaleziono rekordów"
        else
            echo "$WYNIK"
        fi
        ;;

    3)
        echo
        echo 'Podaj parametr rekordu do zmiany'
        read PARAMETR

        WARTOSC=$(echo "$PARAMETR" | cut -d= -f2 | tr -d '"')

        grep -i "$WARTOSC" "$PLIK" > /dev/null

        if [ $? -ne 0 ]
        then
            echo "Nie znaleziono rekordu"
            continue
        fi

        echo "Podaj nowy rekord:"
        read NOWY

        sed -i "/$WARTOSC/c\\$NOWY" "$PLIK"

        echo "Rekord został zmodyfikowany"
        ;;

    4)
        echo
        echo 'Podaj parametr usuwania'
        read PARAMETR

        WARTOSC=$(echo "$PARAMETR" | cut -d= -f2 | tr -d '"')

        grep -i "$WARTOSC" "$PLIK" > /dev/null

        if [ $? -ne 0 ]
        then
            echo "Nie znaleziono rekordu"
            continue
        fi

        sed -i "/$WARTOSC/d" "$PLIK"

        echo "Rekord został usunięty"
        ;;

    5)
        echo
        echo "----- ZAWARTOŚĆ BAZY -----"
        cat "$PLIK"
        ;;

    6)
        echo "Koniec programu"
        break
        ;;

    *)
        echo "Niepoprawna opcja"
        ;;
    esac

done
