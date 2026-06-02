# Systemy Operacyjne

## Zadanie śródsemestralne - baza_danych.sh

### Opis projektu

Skrypt `baza_danych.sh` implementuje funkcjonalność prostej tekstowej bazy danych.

Dane przechowywane są w pliku `baza.txt` w postaci rekordów o strukturze:

```text
Imię i nazwisko | Miejscowość | Numer telefonu
```

Przykładowe rekordy:

```text
Jan Kowalski | Siedlce | 25 645 30 30
Wacław Nowak | Warszawa | 22 742 30 21
```

---

## Funkcjonalności

Program umożliwia:

* dodawanie nowych rekordów,
* wyszukiwanie rekordów,
* aktualizację istniejących rekordów,
* usuwanie rekordów,
* wyświetlanie całej zawartości bazy danych.

---

## Wymagania

* system Linux lub WSL,
* interpreter Bash.

Sprawdzenie wersji Bash:

```bash
bash --version
```

---

## Uruchomienie programu

Nadanie uprawnień do wykonania:

```bash
chmod +x baza_danych.sh
```

Uruchomienie programu:

```bash
./baza_danych.sh
```

Po uruchomieniu wyświetlone zostanie menu:

```text
----- BAZA DANYCH -----
1 - Wstaw rekord
2 - Wyszukaj rekord
3 - Aktualizuj rekord
4 - Usuń rekord
5 - Pokaż bazę
6 - Koniec
```

---

## Dodawanie rekordu

Po wybraniu opcji:

```text
1 - Wstaw rekord
```

należy podać rekord w postaci:

```text
Jan Kowalski | Siedlce | 25 645 30 30
```

Program sprawdza, czy rekord istnieje już w bazie danych.

---

## Wyszukiwanie rekordu

Po wybraniu opcji:

```text
2 - Wyszukaj rekord
```

można wyszukiwać rekordy według:

```text
imie="Jan Kowalski"
```

lub

```text
miejscowosc="Warszawa"
```

lub

```text
telefon="22 742 30 21"
```

---

## Aktualizacja rekordu

Po wybraniu opcji:

```text
3 - Aktualizuj rekord
```

należy wskazać rekord do modyfikacji, np.:

```text
imie="Jan Kowalski"
```

a następnie podać nową zawartość rekordu.

---

## Usuwanie rekordu

Po wybraniu opcji:

```text
4 - Usuń rekord
```

należy podać parametr identyfikujący rekord, np.:

```text
telefon="25 645 30 30"
```

Program usunie znaleziony rekord z bazy danych.

---

## Wyświetlenie bazy danych

Po wybraniu:

```text
5 - Pokaż bazę
```

wyświetlona zostanie zawartość pliku `baza.txt`.

---

## Wyszukiwanie przy uruchomieniu programu

Program umożliwia wyszukiwanie bez korzystania z menu.

Przykłady:

```bash
./baza_danych.sh imie="Jan Kowalski"
```

```bash
./baza_danych.sh miejscowosc="Warszawa"
```

```bash
./baza_danych.sh telefon="22 742 30 21"
```

---

## Pliki projektu

```text
baza_danych.sh    - główny skrypt programu
baza.txt          - plik przechowujący dane
README.md         - dokumentacja projektu
```

---

## Autor

Emil Anusiewicz

Projekt wykonany w ramach przedmiotu Systemy Operacyjne.

