title: Jak zacząć udzielać się w projektach Open Source?
class: animation-fade
layout: true

<!-- This slide will serve as the base layout for all your slides -->
<!--
.bottom-bar[
  {{title}}
]
-->

---

class: impact

# {{title}}

---

![DoomHammer](doomhammer.jpg)

[https://github.com/DoomHammer](https://github.com/DoomHammer)

[https://doomhammer.info](https://doomhammer.info)

[https://twitter.com/doomhammerng](@doomhammerng)

???

Nazywam się Piotr Gaczkowski, znany tu i ówdzie jako DoomHammer. Oprogramowania Open Source używam od ponad 15 lat, aktywnie udzielam się natomiast co najmniej od 2006 roku.

---

class: impact

# Czym jest Open Source?

---

background-image: url(pexels-photo-461198.jpeg)

???

Jeśli jest na sali ktoś kto nie wie czym jest Open Source pozwolę sobie streścić zamysł. Oprogramowanie Open Source jest udostępniane nie tylko jako gotowy produkt (jak buritto w restauracji) który możemy skonsumować w istniejącej formie bez możliwości modyfikacji. Oprócz produktu dostajemy również kod źródłowy i instrukcję jego zbudowania. To odpowiednik listy produktów i przepisu kulinarnego. Jeśli uwielbiamy burrito ale nie jadamy mięsa, mając do dyspozycji listę składników i przepis jesteśmy w stanie zastąpić mięso dowolnym innym składnikiem.

---

background-image: url(avocado.jpg)

???

Na przykład awokado. Po spróbowaniu takiego burrito z awokado może okazać się że jest ono lepsze od mięsnego wariantu z naszej ulubionej restauracji. Możemy więc przekazać im ten przepis albo opublikować go samemu. Wariant pierwszy odpowiada zgłoszeniu propozycji zmian w oryginalnym projekcie, wariant drugi to publikacja tzw. forka, tudzież odgałęzienia. Osobnego projektu którego historia do pewnego momentu tożsama jest z historią projektu oryginalnego. Potęgą takiego podejścia jest to, że każdy użytkownik ma możliwość uczynić produkt lepszym dla wszystkich podobnych mu odbiorców.

---

background-image: url(11512594484_6ab7131cc8_b.jpg)

???

Wracając z kuchni do biurka: jeśli nie podoba nam się w jaki sposób Mozilla Firefox wyświetla menu, możemy ściągnąć kod źródłowy przeglądarki, zmienić odpowiedni kod, zbudować całość i cieszyć się swoją własną spersonalizowaną wersją.

---

background-image: url(firefox.jpg)

---

## Nie jestem programistą

???

Zanim ci z Was dla których "kod źródłowy" i "kompilacja" brzmią zbyt strasznie opuszczą salę chciałbym zauważyć, że udzielanie się w Open Source nie wymaga znajomości programowania. Przyjrzyjmy się z czego składa się produkt:

class: middle, center

---

1. Kod źródłowy najważniejszych funkcji

--

2. Interfejs użytkownika, projekt graficzny

???

Dla tych którzy gardzą graficznymi interfejsami przypominam że programy konsolowe również mają swój interfejs zaś niemal wszystkie edytory posiadają interfejs graficzny

--

3. Interakcje z użytkownikiem, użyteczność, UX

--

4. Media (dźwięki, wideo)

--

5. Warstwa tekstowa, tłumaczenia

--

6. Marketing

--

7. Warstwa prawna

???

Jeśli jesteś w stanie pomóc w którejś z powyższych kategorii, nie ma przeciwwskazań by zacząć udzielać się w Open Source.

---

## Nie potrafię tworzyć

![Firefox](7299833422_000e92f28b_c.jpg)

???

Są dwa główne sposoby udzielania się w Open Source. Możemy zgłosić swój pomysł, propozycję ulepszenia, bądź raport błędu w odpowiednie miejsce i obserwować wątek licząc że ktoś wdroży naszą propozycję lub naprawi błąd. Jest to metoda szczególnie polecana jeśli wydaje nam się że wiemy jak coś powinno wyglądać ale brakuje nam kompetencji by to zrobić samodzielnie. Drugi sposób to wysłanie konkretnych propozycji zmian które jeśli przejdą recenzję i kontrolę jakości mogą trafić do kolejnego wydania interesującego nas produktu.

Jeśli korzystając z Firefox znajdziemy gdzieś literówkę możemy albo zgłosić to jako błąd "hej, napisaliście dpua z błędem" albo znaleźć odpowiednie pliki zawierające tłumaczenia, poprawić literówkę samodzielnie a następnie wysłać nasze zmiany do recenzji.

---

class: impact

# Dlaczego warto udzielać się w Open Source

---

## Zwiększenie kompetencji

???

Współtworząc Open Source możemy wykorzystać swoje umiejętności w praktyce. Dzięki temu że nasz udział jest poddawany recenzji możemy także uczyć się od innych.

Pracujesz jako developer COBOL, ale całe życie marzyłaś żeby zajmować się UX? Dołącz do projektu Open Source, rozwiń swoje umiejętności i dołącz ten projekt do CV!

--

## Lepsza widoczność

???

Im więcej się udzielamy tym lepsza nasza widoczność. To z kolei oznacza większą sieć potencjalnych kontaktów i większe grono odbiorców naszych *pozostałych* kanałów (blog, kanał YouTube, LinkedIn, produkty komercyjne). Co za tym idzie?

--

## Możliwość znalezienia zatrudnienia lub nowych klientów

???

Jeśli komuś spodoba się to w jaki sposób piszemy kod może zechcieć zaprosić nas na rozmowę.

--

## Możliwość znalezienia potencjalnych pracowników

???

Jeśli komuś spodoba się to jakie projekty tworzymy może zechcieć dla nas pracować.

--

## Możliwość zrobienia czegoś dla innych (i zdobycie ich wdzięczności)

???

Robicie coś dla siebie, pomagacie innym. Inni są Wam wdzięczni, łapiecie endorfiny i jest błogo. Efekt podobny jak po zjedzeniu tabliczki czekolady, niemniej bardziej rozwijający.

---

## Ładne statystyki

![GitHub Stats](github_stats.png)

---

class: impact

# Jak znaleźć swój pierwszy projekt?

???

---

## Popularne projekty

https://github.com/search?q=stars:%3E1&s=stars&type=Repositories

???

https://github.com/search?q=stars:%3E1&s=stars&type=Repositories

Wśród popularnych projektów Open Source możemy wspomnieć o Android, Firefox, Chromium (czyli wersji Google Chrome pozbawionej brandingu i kilku innych własnościowych elementów), Kubernetes, Docker, TensorFlow, Atom, Notepad++.

Jest spora szansa że ktoś z Was korzysta z nich na codzień. Być może wiecie o ich irytujących przypadłościach lub macie pomysł jak sprawić by były lepsze. Wasz udział mógłby pomóc milionom potencjalnych odbiorców. Czy zatem powinniście zakasać rękawy i napisać zgłoszenie błędu albo wysłać łatkę do któregoś z powyższych projektów? Nie polecam tej drogi.

Te projekty są ogromne. Mają całe rzesze opiekunów i jescze większe grona użytkowników. Każdego dnia zgłaszane są rozliczne propozycje zmian które trzeba recenzować, poddawać kontroli jakości a przede wszystkim oceniać ich sensownośc i zgodność z wizją produktu. Jest spora szansa, że nasze cenne uwagi przez długi czas pozostaną niewysłuchane. To sprawi, że nasz początkowy entujazm opadnie i łatwo zrazimy się do kolejnych prób. Nasz mózg lubi natychmiastowe wynagrodzenie. Spróbujmy to wykorzystać!

---

background-image: url(github_most_stars.png)
background-size: contain

---

## Rosnące projekty

https://github.com/trending

---

background-image: url(github_trending.png)
background-size: contain

???

Za dobry cel pierwszego naszego aktywnego udziału w Open Source polecam projekty nieco mniejsze, choć aktywne (na przykład z listy [GitHub trending](https://github.com/trending)). Alternetywą są duże projekty które charakteryzują się szybkim casem reakcji i wysokim stopniem pozytywnych odpowiedzi. Dobrym przykłądem jest tutaj Homebrew bądź Linuxbrew. Są to zbiorowiska paczek do których łatwo można dodawać własne paczki oprogramowania lub zgłaszać nowe wersje instniejących paczek. Przykładowo jeśli wiemy z Twittera że własnie wysła nowa wersja gry NetHack możemy zgłosić poprawkę do Homebrew która zmienia aktualna wersję Nethack na najnowszą.

---

background-image: url(awesome.svg)
background-size: contain

## Projekty typu `awesome`

https://github.com/sindresorhus/awesome#readme

https://github.com/hackerkid/Mind-Expanding-Books#readme

???

Alternatywą wymagająca najmniej wysiłku jest przejrzenie listy https://github.com/sindresorhus/awesome która wskazuje na inne listy tematyczne. Jest to odpowiednik Wikipedii pozwalający dowolnym osobom dodawać informacje uważane przez nie za ciekawe. Nie wymaga znajomości kodowania, wymaga jedynie wiedzy o czyms wystarczająco fajnym by podzielić się z innymi. Przykład? https://github.com/hackerkid/Mind-Expanding-Books#readme

---

## Imprezy

- [Hacktoberfest](https://hacktoberfest.digitalocean.com/)

- [Google Summer of Code](https://summerofcode.withgoogle.com/)

???

Ostatnim ze sposobów jest wzięcie udziału w imprezie typu https://hacktoberfest.digitalocean.com/ bądź https://summerofcode.withgoogle.com/ gdzie prezentowane są sugestie projektów w których warto się udzielać. Dla osób o niskiej pewności siebie: wystarczy przejrzeć listy z lat ubiegłych bez konieczności brania udziału w imprezie.

---

## Hackerspace

### [https://hs3.pl/](https://hs3.pl/)

---

class: impact

# Dziękuję!

![DoomHammer](doomhammer.jpg)

[https://github.com/DoomHammer](https://github.com/DoomHammer)

[https://doomhammer.info](https://doomhammer.info)

[https://twitter.com/doomhammerng](@doomhammerng)
