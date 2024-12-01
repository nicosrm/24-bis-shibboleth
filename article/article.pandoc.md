---
author: Johannes Merkel, Ines Rohrbach, Nico Schramm
title: Shibboleth
subtitle: Single Sign-On Login System
subject: BIS Projekt
# TODO: add `date: <date>`
lang: de-DE
papersize: a4
geometry: margin=3cm
colorlinks: true
link-citations: true
---

# Shibboleth

## Einführung

- allgemeine Worte zu Shibboleth
- Motivation
- grundlegende Begrifflichkeiten

## Funktionsweise

- Konzept
- verschiedene Komponenten

![Login-Prozess mittels Shibboleth (Diagramm nach Prozess-Beschreibung aus [@switchExpertDemoSWITCHaai2024a])](../assets/bis_bpmn.drawio.svg)

[DrawIO](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&title=bis_bpmn.drawio#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%2278sKbAdPxCWYyD5-eGmq%22%3E7V1rc6M4uv41rpr9YBfizsd0MrMzp9KzqaRnd%2BZ8OYVtYnNimwzg3H79SoAwSMII20LYVtdMd8AgE%2FRenvc%2BMm7XH%2F%2BM%2Fdfl92gerEa6Nv8YGXcjXTcdV4P%2FoDOf%2BRnDNIozizic5%2BcqJ57CryA%2FCfDZbTgPkuJcfiqNolUavtZPzqLNJpiltXN%2BHEfv9cueo9W8duLVXwS1x0Annmb%2BKqAu%2B084T5f5WVd3dud%2FDcLFEn8zsL38k7WPLy4WTpb%2BPHqvnDJ%2BHhm3cRSl%2BU%2Frj9tghd5e%2Fb380vBp%2BWBxsEl5bvifH3f65vvff%2F7Hfnq8eX3748f%2F%2FfhjXKzy5q%2B2xS%2F8GCRJtI1nQfHU6Sd%2BFcl7uF75G3j0bZmuV%2FAkgD%2FOluFqfu9%2FRlv0FEnqz17w0bc4SOCGPuBHBMSp7z6iEw2tF8XhV7RJ%2FVVxAq4TpwU16PUrntBXFJe9L8M0eHr1Z%2Bi6d0iC8NzKnwarb%2FCaRRxtN%2FPbaBXF8NN58OxvV2m2dhy9lLtpwDPFSwjiNPhofLug3DNI7UG0DtL4E16Cb3CKbS4IfaxjQn%2FfkY1pYH5YVmhGx7f6Ba0uytV32wl%2FKHa0w%2B4a1O4%2BBfFbiPZWe4ijN8haMec279mQYi%2Bew9WK8bKL1X6pfLqJstU7bpTOu1HNhN64ezprr%2Bxe9wpLlMpmPcSjW2P07fZ5u1nAT26j6CWEshB%2B%2BfZ5pNvZO3qGW4DkWs4C8OzfWyRQvt1CHg7R7mq%2FB%2B%2B70%2FCnRf4vlEfhNIHMHkYbvBh88Hw9fBFBGq9RuEmzX9z6Bv%2FTJro10m%2B17H8LXnCbnWSdc%2BiTAB3hFeonWecci7UkYHw3eU5nnGQuyfhujXhI%2BB%2Bky6X%2Fit7I%2BmOBtN5k%2BrreTFI%2FeWmQSDFUTE%2FFW8xIPZijVXJmAhohTxFPhZsgLo6Dj1d%2FMy94bBatVv5rEk6ztdAZ9LXf%2Ffglu96fQpbxkRZsZ67DWcnYz0puXRACi2ItoDM4yxUmBGkdx0vYJHXuo20eSi6vpYi5kW7bqLSZIBd%2BGrz7n3qdvNCGhxDe3CP6eIiSMEX8b9xNozSN1jyEg1e4WYULdGcaIRr3i6MZpB1Ei99egziEG5jRZbyM1tNt8rA79Q0ChBWk8tsStmm7kzsVkXyup9Fqd7x4%2F%2FGZ%2FabBx2y1TcK3QCAlm7ZVo2SGQrcYhGwJI2SaboM5BKvFYRSny2gRbfzVz7uz30p5k7%2Fg8pr7CG1bRhL%2FH6TpZ6Ha%2FW0a1QkGvsH488%2Fi%2FuzgL3QAKbA4vPuofnj3WT2q7Hh2klMqoV%2FrgJ2EryZHru1aFqKZRbB3wQbAEAcrP83ormponHqrTVPuVu9296%2Fa5nbYalJMrMP5fMUF%2B0TTAFYIrTRg6UfSQHHrA9IuFbniERrSJCRG%2FmDFXQQllY9xBHFZDIWYA8B5%2BIbB30uAJDF8qJfsV90hxMo1jNueIKqEIjtIl%2BMnClzWbmXQd6aU6jRJ6ZVGusosS3%2BHjOo6%2Fe4oTFR4F4rVRxVnQQtN5ozcqGK0CajrmELEH0ph%2BJLo%2BTkJxBCPewCaAmYOZYp%2FW%2FCUa7GvZiMqfHXxbwumwk9CXc2LqoK3bMOlQyq4VeFrErRCKj95zQ%2Bew4%2FM7NhhLGjSb%2BZ%2BPK%2FirDXk2cwjJgxVAXdYqMr0FKo6VqNiodCqUXP4JQtVWTolux6DeYjMc16LULk6BuLqSAJ0pTw3RxnHKN0ctBzr188BnLMXZMFHmP5ZEkOYVpaCR7uV0MFn5WBwApHbxACuJ8TGsJy6lh0Dzauvkf8OlJFBreRo3sSr%2FHFr61pWr6YLYKFPygaBxLVNvxA13IQbxH5%2BqgyZIw0Z0KC5i%2BXHEFp79pHWC17Lduu3iLNmPIO5fYJlpnTx5Oqc4sl1ZeI1%2FJjK1lS25mG2pmnV1aBHB6N6NTbx91%2BbvOG1D70Gd1lP8oZGFz%2FHSQrvzAPwN9t0CV9I%2BBx%2BhUEMzyVjf%2FMcIxpW5uN5mY9DiJQDi8gZcmWbkJ7JA68RG0zGj8Hf2yBJOUGx4odh84NsdwpwzKHxgtcOPtFb4ko5PL091uZkJ91TrPdpMt6nLcw9pWntL5TJH3M%2F9fFLrkBeypBuxMStpneOgTFbWQehp0N4wmtw%2FkjcJFayFKUBHiEc%2B3xK%2FbSDO%2BXm%2Bz2hMqYxeX2LEoHvlzCHTulUQbgZk8AIJ58SKavPdBYrSpj8xV%2BHK8Rp9axLKbRDZLRi%2Fmewv8agLDIV4YSUxWHMV22hYDWN3qtmEHrRhYkDiKQ2qLxQfvGokjteOYafFvfZo3oiMzqe%2B8kyM65AcfDgp5CWNtkZXTPzBW5QKcFu07NFiHN1Mw27svHPw3Rl7xc9WMwc6c%2BjlJGueRPSx8frjoaKrH0x0V5oW0qoRbQZ3x6ssG020RxJIIZFZFoCw%2BKijpNtqGPL2NDLSgIoqIOHjpxj0wAa6MghM%2BtIOhIuGGxKyf07iP14GoRp7kNCOAi5kpIEIRUUVNLCzctqUriXJuMR0ty2v868stnf6KM0jcPpNh1noGsdIOiiTOzzMrGH4HIybAIXMhzifWct0HVPu6Qc7WuLwLS%2FWQTIz5oGiF%2BaKxQVCwybBWR7mSgFIZ%2F8XZbL9VzcTIZtEwqX8T69Xh0YOLtUeZlIGmvO3WBUvwLXzqRKjxtHQyeWGylIx3kd7KioYO3mhaJu35%2FaQy1wH838tHKD8mEJpUxgT1yHQZy9ihTvIq39dnvO9XjtOe9Yv8CRooMO1SBbKorDJI%2FTw89%2BegxmyzR4rZTU%2F0PhxzPDj0MwoVynHfL0CyFxpFI5r44Qdh6v80rXrCOFXYNjGxC2Sc%2Bp1Tpv6A%2BJUW689BbFS8jewZUnT7cE68baRAOgnlmPWzMdm0xt4sAbsa745GoUPOtAURr%2BLMSfbEL4SYVwQpLQ2tH3SQjy4pFeB%2BHXoBx7Qnoey0jkA3Gql8s193IBGuGpkl12XHCSKm6QTc8nKG7Ivdolfc%2F8zSwDML0RM6v4tGdqpt2u%2FwyS2TK3ttOvTMGrwM25Gt6yAze6NjSrm6Z3ouqUjDmcR%2FPUPe06GX7jun95BJVq9oeHUvppwmoy8h7ZTViBMNlIQ9ZDKKW9%2F2qv7VQbfCBd26mKe%2Bu6FKeYMFMO56e1mnLH2mcNzimrzli4u0BfeVUKK18KVmYVAi8CiEr84xBzQwQKJyoQrlXZPadonXCDC0m1rCe3tqijZ5X3pODz4eRPim9DNnrG%2BuPKtLPNWwfvSHWz2nQd%2FJ1fLYTPRdQ6E0%2F2YhXOlpmA%2Bm3%2BoNKSz0029RNT3y%2BfXHdo8okVC1WA81IA5yk6z%2BynaIfociobcTo0%2FaockY7aGwuFVu1tS%2B2aJaeWTf7u8FYxOlJ7DDm0K%2BNmm7z7y2xuWjbdB8IohaIUiupu5WmDg1F0AtDNFBnDmbkwL2ZZJYvgHZkSN%2BZylWJDQnHAmXGAdB8HOXhKOvUDw71KTQwMk1MVA0NqP%2FjyQZWZp8y8g4SObhCdK2TbeQVH1XtYhpsF3LTSb3ezWQcrKGL8TNkqNXtWanYIQFM3ncGpWroE7OFfTz9Kmr9TxH6GxC4bU%2Br20AJnZTtA5cg7BqDyToEs5Iq8ylYpFsRJ50DK322X129rimlvpmuEFBl7hHhoSJ%2B6iWP%2Fs3JZoa4av8hwiS8qsmSbeumVXSGZl8Mf8gc4bSoX3g1lcymb67BcLhc3JhmIzaVrtM2lSFqRdAeS9gbmRtDBZQ1G4sUKpUZsr4QFukxkWD5oReb873YRh8%2FPWUwF%2Fb1QBVgXYwkPwe1jDi6%2BqAOgrOGjZZ7Gaw0XQkeezNMVzroQnEWUTMNF1uHGT4PjqtJa5JdOlE3LRlmM8OOvcGl45l%2Fxwt%2BESdFqkCDxMyklba9HbK417aU6lLX%2F7OJQU5gGwyq0QgK%2FzdGMuRQ9%2BEMcvYVZAIOLBE5RI8q7J8cxqrG%2F7yN3%2FaihidoYgDsaXIgFhAmtFQ5w9wICcnsBHdQKSIGBIYIBYcNhrRZ9QAxJl40HgHZZqdvcMgdo3CNoNKnZ24DRtekBt5QtklpRugFqP7ubkKl8LcrX0lk4Da4mDjDbOfLRtmq%2Bd%2BHN9%2FYTs042LJOvaekSZ0azUKJRj9a9Q2lrP1I02iZLx%2BSdpKzyP7qjC%2B589CYPwtEZIK410Sp%2F6rgTWN7Eq%2FzBI5H66q6Df6G2Pr14KpOa%2BH0BKKeHln5tSoHI4yj9c%2FIgDlY4V2eAmbw5csCUWtxcPqhy%2Byi3z4Fyxx5YbwZgXVayTQepw9sPCVjHArMjpQ5tLvwbUv5z%2BFKE6FRp1fkjokH4fXRncH4fkyO9tSqvgtU0eq%2BKKjRerhBDgPCiQBCKQo2jSrS5cgw%2FLe6zR%2FXwJjqe%2B8kyE4CgOHjwU6iJNtkZNHwkW%2BAmjqP3USWKCRchztVFafARpsj4BRMNFIdFeo9THO7MX3TwWTkYoPFrNtBblZ6wd%2BZYM9dyCCJsmNtO3%2BkAtoPoxBUS1PfgUgyxNQ%2FWtcZ1LG6zwmog054UvEUr%2BCB%2BjlaLOAhnS%2BbuXeCYKmt%2FAtUY2i%2BWbhwnK8TPnSqpTgUqVKCiI%2FryLLYekmYb2tfqkcLjDzlUh9waXfygtdE30AIpR88GmT2ia7%2F%2B%2BH4%2FfgrCrBQj3LysJvDfp5vv98hwTBLEZIxsT2U1KquxVW4ZQBua1WjRHTmegvSr0vntt%2FkDZIds%2FnoxlF11j1bUfwj1697QqN%2FmCqnmLWo4MwV%2BqhgkQelrzOeYq4jsBfCS9IisYQ7O92jvdzVeMPz1eOGvLTU0Uq48jBSl8rOLTVE6ersPc5yS3VWL1PlGhy55vW5qe28wLHPvDWI8szr2DHXLA5wGUAuj18Wb5LdNl6io6zn8glZhl0y%2Fy3MytlXpjbWJZ%2BHxnpgWRqcITxg6a1Hx%2FkhdV%2BPrLiVnRcCo544eydIjKK03jG4OSeOfa1Iyd2isEB%2FyAB7t3yzS3rXrC5EVxL83RFZXM%2BPBx8tKxXhtRlY5FrSdBw25RhZ%2BUIUgzh5ByMp6JTvVy8cRRseyE%2B1riyj%2BNfiChlQyW1YzLpM8rJbfPY3byrCUZ1R5RrtxjzE0z6hOq4T7aBFuxr%2FC17rqtWdM%2F41h8C5otAxjN4oBAkcPSHGACkNPJWG1mzA6d9eGnHukpWgoB4yCT3xkv0fyECXsjGLFfjPDdI4GSGjvuHqxNb64w5NJW14o8MhUbEbXryJ7vf5KbXGvlKPSgclgcz%2F18WuuMBPl5Gjktla3SM5dGFtZBymDw%2FiiISe4tksMwhe4S1y9G56CNE8qglf%2BhPrx%2FP4PfvuAWu0%2BmhWVXgeaGPDFExL4lJ4whA8wbZSIjOjf90y39EOFOb%2F463CFWPAW6vsws6l%2BD94lERX2ohGmKkMwsGStKY7k6GS2vaDvQkqg8M9%2FVX7O3OyI4yvlT4aT%2B%2BT7rIDqglMbpkyKKIEChIlC0iR3RRTZbBu49YVENwVhuBx%2Fjtdhmq7yrOa84LXijdlQ3hjlZTkrL0s%2FuZytQBuQvaKku1pwfKSDo1K5Jq%2BEacS7JlsZhvRNDoBhpDS0OI%2BxDB1wC3d4spBQ8lIEztsVQfmV5bsidOWKaCKzAbkidIYrInM1jLHrQXkBDthPvA7hBWCoNcDYbUPcbisvwIFegPNI3uNXzaV4Plw1i3A%2BHO5tMIgKOlJknqr%2FCvk9Rg9J%2FgAnrO7l2x2DTFfR7OXHMtwwNFtFYa6C52oYjNSnpdzGEj7ORVSzgN%2FDxu6OjUkpgZ86ekMR%2Bw6Sw2xm%2BJKPy5KaTl2PzoPb8fQlDv8hdxebo1N12WwDXIJtdHLuDb9b0WpZSXizYTqduBnYloHdCh8yI8bCmTN59WfhZvFY4AxLtM3fkAdT0RpYqtXSXOyTKBK3RiLFXPReWvcw5mEpUc0tqmvo7ChRPbA6Sm5RjV21HBndx6YkNWEwohPHuDRSOstqk8iQ0MmVhMeAOPw6SlY35Y72I6tJGiFmB4iT1QZtDd%2BFySyC7xD99k%2FBW8gYNH0xwyv7mFDJyDFjD6gEwtLMsEXZuMtxh20%2BowGVDT3Fug6oFLcx1iHTmFRO6zXltJr7wx4mUREku9ehTVM0nXFChtGZ03Lp9L0w2cXgVcT9rCPu%2FaSptPCONbROSZiXzzjkXjZer1q0pX07gKbrGAu1mqFYN7daofax00zZNoFNuAvxnNsWC%2FRUloFNm403U5QoU5mQCnnyOZ%2Bbupii9z7K%2BkGqBpDnJo3F5z%2B1SGLHGpokds5eEsuXoDa3BG3IIegn88nhyNJRRpgywva4fAwizUW2FYblYoWkd5nNSjkr5dyJuk2yYl%2B2dnYltyu9CO3s8GY%2FuccG2Y5zkdKijN58FUy%2B3LwfwEnPOMGhlZ6PHn7LttctIu6Dp5J1Dhk7RstCgiPGPJOXrj5gbDUIRSm5PURVqbhwMWNMjhLGAoVxn%2FLT0jnlpyXI30nk3JDZy7zik1ynnO3Ul%2FhU%2BTYc4lNqug0hPnGz1x7kpyo%2BkdiCglsSNiSAC6j2sBoaUnUWemSjCZ0PM3at%2FaC%2BR%2Buh9sPm4RqFOi43n5iXcW1eE9A5yfwVmjuIMNb4UAwD2YosZu7ZCHQ43C5Xj2LshgRDGSgGuL2hGIfVu03JY%2BWSowiFNwDsNDT3Ojat3iDF6MEC2bRbVhItjzkw0NXLY6fBsyuliGMM7N5K7lyO3shKIp8OIfcpRLHF1R6n08UIUbuhoKWzDHUIDgE9Y1qXo9ri6mWo2%2B78EChDx%2BSIht5CG65yzcnK0%2BaWhByto07klwM2JasIZc4t9UjxWYqhE7vm6C8CJsEoAnxzHkfypEIeyhYce7y2oHdsMnADe7ik6%2Frwrs5my0qCcYzH4X%2B5ehzjtfcLF4pjdFIWG30hGWDqSiYrmczVacXjFMrAFBMx0e2DG6s4pB0qupGKyeFkuXqxWwifYcRExrrVX9crk8O70E%2F%2F5P39SXSHapSMkZG8cUAmR2LhlXVKLghqv7nb8y6xUtuoPg3FyAS4M8GGezZTveOyms8kkH4aOjMzZACrM7O4%2BUyM1iEKtqo0HxaliAGjhk1oRqrxEy84Nagajr7Bqt1FoV4tWG1q3SElgYdM2RSIVRn1wRR1qJL3ayl5328vGI5WRwq7FvvSxubiXDcFFRRU2A8VuKucgSsIVHhkUjCV9sCLKkxApRj1nEEBeBKNFKxoysSRASsMovpNJKrgiQVfTgrFyeRYLxkNpka6%2FQDZn4NbDpEB0LHB2dS8a04D%2FU3Y%2FyA0qUEHyhXRCV8c2%2B3xbCNoOsbG7bMKNDE57rqlk%2FDcIpLmuENqttu21KlGSJEthSBQs%2FY%2FG3UHnkLVjJbc%2FXeIkh3K89IOkQoJKy09w7GcGm0AsruqOJhkc7RXGUKc0KTGVY1Io7%2Ff8JPVxfa4jhhhkyNc2h7ZLMciFex7ClIi1NcaH8wbxP92x31DHKTbGHUk%2FuPxXgUURRJb8zgN3B2gp0G%2BgMP%2BHIJkBQbpEtKxQ7OVcS1hL69LUul1SNeCoAYkXnXAqlI5Xlg%2BZsJyXBGVXAkbk%2FFDHKXRS4SenPO%2BH7mhpCSySALF3WXqUobRttVgUC8Zqj7h7G2eXp6X4yA80%2FZHhSroxSsJSCtjbJDduLgLrSwi50JUDyTqi8a6phPMIcKxYKgibwb%2FqqAng1KKKzkG24vp5Ug1w6V6gfOn%2BRstKwkOeeoGRyxA%2BfMMqWXj9ZAnlaMqzpmn88y6HoLNSc8h1hhwEKfh92PMdJpMfCUmJ8cc4p5NToP2qtST9ZWFdsB%2BNiThM3iSlYRvCNttxqhgGmReoIk28TyvihYnlnFNYWwsitvD2EZ%2FKStUd1zjcBRJjrDhRJGdA9vkTFEsmMWahjwV30NAIQZlF%2BAIgTwU0qms90pQCEcRb88ohFldSwcWb77fPwbJa7RJ%2BEOLyTKcQk2RBqr8sA8a2lNvyCIpcfWGDodhf4FQB0w0jcjXs40rco5hScJREaD1BnUMR%2FMmRt0WMI2JZni7Pwc2IDMcg8zqs4leNCcCP1TVI7ZdhIIf90w8MMD26vug23wSUJhSdZX%2FhU1MAwI%2BzJoKQcH4zklYCiGJoLV68L4tWn8A5cHDOIrSqhhGvP09mgfoiv8C%3C%2Fdiagram%3E%3C%2Fmxfile%3E)

## Einsatz

- Einbindung von Shibboleth in existierendes System
- Voraussetzungen etc.
- Demo: ggf. anhand von [https://informatik.htwk-leipzig.de/seminar/](https://informatik.htwk-leipzig.de/seminar/)
    - theoretisch oder wenn noch Zeit praktisch
- Preisgestaltung (Mitgliedschaften)

## Diskussion

- Bewertung / Einschätzung von Shibboleth
- Alternativen / Konkurrenz
- Zukunft

## Zusammenfassung

## Literatur

::: {#refs}
:::

---

## Notizen

### Syntax

Quellenangaben funktionieren mittels `[@citation-key]` [@template]
und die Einbettung von Bildern so:

```
![Caption](../assets/placeholder.png)
```

![Caption](../assets/placeholder.png)

### Shibboleth allgemein

[@shibbolethShibbolethConsortium2024]

- seit Anfang der 2000er Jahre an Spitze der Identitätsmanagement-Software
- Verwendung v.a. von akademischen Institutionen, Identitätsverbände und
  kommerziellen Organisationen
- Shibboleth Consortium als Generierung von Finanzmitteln zur Erhaltung der
  Shibboleth Software
- Finanzierung durch Mitgliedschaften
    - erlaubt Unterstützung und Pflege des Systems
    - verringertes Risiko für Organisationen, die Shibboleth verwenden
- Angebote vom Consortium
    - Identity Provider (SSO)
    - Service Provider (Verwendung in Web-Anwendungen)
    - Embedded Discovery Service (Liste an Identity Providern)
    - Metadata Aggregator (Verarbeitung von Metadaten bei Verwendung mehrerer
      Identity Providern)
- Mitglieder: u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology [@shibbolethOurMembers2024] (Auswahl)

[@cantorConsortiumFAQShibboleth2023]

- Open-Source-Softwareprojekt
- entwickelt Software zur Unterstützung von verschiedenen Standards zur
  Unterstützung von föderiertem Web-Single-Sign-On
    - bspw. SAML, OpenID Connect
- effiziente Anmeldung bei Websites
- _Identity Provider_ als zentrale Komponenten
    - Login-Service für Anwendungen verschiedener Organisationen
- explizit kein Hosting oder Service, "nur" Software
- eher Mittel zur Verwaltung des Zugangs zu Ressourcen anstelle von
  IP-Beschränkungen oder Proxy-Servern

<br>

- kein Service Provider, sondern _Identity Provider_
- Unterstützung von föderiertem Login zu bestimmten Web-Services bzw.
  -Plattformen, meist SAML
- Einloggen mittels lokalen (bereits existierenden) Anmeldedaten des lokalen
  Login-Servers statt ausgegebenem Passwort oder anderem SSO-Anbieter
- Zielgruppe: Hochschulwesen
    - Verbänden von Universitäten und Dienstleistern
    - föderierte Anmeldung mittels SAML
- direkter Hinweis, dass nicht für Einsteiger in das Thema gedacht
- "We make complex software for complex needs and we assume a lot of knowledge
  up front, as is common with open source."

<br>

- verfügbar unter Apache 2.0 Lizenz
- Open-Source, kann jede:r downloaden / installieren
- (teilweise) bezahlter technischer Support durch Mitglied des Consortiums
  möglich (siehe [Technical Support Options](https://shibboleth.atlassian.net/wiki/spaces/consort/pages/1059684709/Technical+Support+Options))
- Finanzierung basierend auf freiwilligen Spenden und Mitgliedschaften
    - bei Einsatz, v.a. kommerziell, vorgesehen
    - bezahlte [Mitgliedschaften](#shibboleth-consortium-mitgliedschaften)
    - stellt keine Instanz zu Verfügung oder Ähnliches
    - keine Voraussetzung für Verwendung der Software

### Shibboleth Ziele

[@shibbolethShibbolethConceptsUSGoalReq2018]

- Bestehenden Authentifikationmechanismen können für webbasierte Ressourcen 
  benutzt werden
    - keine neuen Anmeldedaten pro Ressource
    - keine Verwaltung von Anmeldedaten bei den Ressourcen notwendig
- Benutzerinformationen können zentral verwaltet werden
    - Ressourcen erhalten Änderungen bei der Anmeldung
    - keine Dopplung/Kopie von Daten wird von der Ressourcen verwaltet
- Bekanntgabe von Benutzerinformationen erfolgt nicht durch die Ressource
    - Kontrolle liegt bei der Organisation oder dem/der Nutzer:in
    - keine zusätzlichen Sicherheitsmaßnahmen auf Seitens der Ressource notwendig 
- TODO: weitere, anschauliche Motivation von [Switch AAI](https://help.switch.ch/aai/about/introduction/)

### SAML

### Konzept

[@shibbolethShibbolethConcepts2023]

- SAML als primäres Protokoll, welches durch IdP unterstützt wird
    - als einziges von SP unterstützt
- Shibboleth Software besteht aus 3 Hauptkomponenten
    - _Identity Provider_ (IdP)
        - Authentifizierung
        - Weitergabe von Nutzer-Informationen an SP
        - innerhalb der _Home Organisation_ (Verwaltung des Nutzerkontos)
    - _Service Provider_ (SP)
        - Schutz von Online-Ressourcen
        - Verwendung der Informationen vom IdP
        - innerhalb der _Resource Organisation_
    - _Discovery Service_ (DS)
        - Unterstützung des SP bei Ermittlung des IdP des Nutzers
        - Standort überall im Web möglich
        - nicht in allen Anwendungsfällen nötig
- TODO: [@robinsDemystifyingShibbolethAdapting2024]

#### Basic Interaction

[@shibbolethShibbolethConcepts2023]

![Basic Interaction [vgl. @shibbolethShibbolethConcepts2023]\label{fig:basic-interaction}](../assets/basic_interaction.drawio.svg)

Grundlegende Interaktionen wie in \autoref{fig:basic-interaction} dargestellt

1. SP erkennt Nutzer, der versucht, auf eingeschränkte Inhalte zuzugreifen
2. SP generiert Authentifizierungsanfrage, Senden der Anfrage und des Nutzers
   an IdP des Nutzers
3. IdP authentifiziert Nutzer, sendet Authentifizierungsantwort und Nutzer
   zurück an SP
4. SP: Verifikation der Antwort des IdP, Senden einer Anfrage an Ressource, die
   ursprünglich angefragten Inhalt zurückgibt

- TODO: weitere Inhalte auf verlinkter Seite

![Ablauf [@michelsIdentityManagementUnd]](../assets/ablauf.png)

![Ablauf-SSO [@michelsIdentityManagementUnd]](../assets/ablauf_SSO.png)

#### System Flow

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Hauptkomponenten: IdP und SP
  - IdP: Bereitstellung von Informationen über Nutzenden an Services
  - SP: Sammeln von Informationen über Nutzenden zum Schutz der Ressourcen
- typisches Szenario
  - Zugriff einer geschützten Resource über Webbrowser
  - Authentifizierung beim IdP
  - Navigation zurück zur Ressource im eingeloggten Zustand

##### Zugriff auf Geschützte Ressource

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Zugriff auf geschützte Ressource
- SP fängt Anfrage ab
- Definition des Pfad der zu schützenden Ressource in Web-Server-Konfiguration
  - bspw. [`httpd.conf`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335062/Apache)
  - oder [`shibboleth2.xml`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2063695926/SPConfig) in [`<RequestMap>`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334391/RequestMapper)

##### SP bestimmt IdP und Sendet Authentifizierungsanfrage

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Auswahl eines [Session Initiators](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334685/SessionInitiator) durch SP
  - basierend auf Projekt-Konfiguration
- Session Initiator
  - verantwortlich für Bestimmung des IdP des Nutzenden und dessen Protokoll
- Provider kommunizieren Profile Preferences gegenseitig via Austausch von [SAML-Metadaten](#metadaten)

<br>

- Prozess der IdP Bestimmung: [*IdP Discovery*](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263/IdPDiscovery)
- verschiedene Konfigurationsmöglichkeiten, Interaktionen, Cookies etc.
- "A SessionInitiator might supply a text entry box, refer the user to a locally or remotely deployed discovery service (DS), or select a fixed IdP based on the resource requested."

<br>

- SP speichert URL der angeforderten Ressource mittels "Relay State" Mechanismus
- konfiguriert über `relayState` Property im [`<SessionInitiator>`](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334685/SessionInitiator) Element
- Standard-Mechanismus verwendet nicht mehr Cookies, aber häufig noch in Legacy-Systemen
  - Senden eines State-Management-Cookies mit URL der Ressource zusammen mit Anfrage an IdP

##### Nutzerauthentifizierung beim IdP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Ergebnis des vorherigen Schritts: Authentifizierungsanfrage vom SP an IdP
- Format abhängig vom Protokoll und Binding/Profil, welches vom SP ausgewählt wurde
- Authentifizierungsanfrage über Client an Endpunkt des IdP (*Single Sign-On Service*)
  - via GET oder POST
- Untersuchung der Anfrage durch IdP
- Entscheidung über Authentifizierungsmethode des Nutzenden basierend auf Protokoll für SP ([`relaying-party.xml`](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726167/RelyingPartyConfiguration))
- Weiterleitung des Nutzenden an kompatiblen Login-Flow
- Authentifizierung mittels konfigurierter Methode
- schließlich Übergabe der Kontrolle an Profil-Implementierung inkl. ermitteltem Nutzername
- Cookies vom IdP (set/read)
  - IdP versucht während Auth.-Prozess meist Cookies zu lesen oder zu setzen (je nach Methode)
  - IdP erstellt Session Cookie
    - zum Tracking des Fortschritts durch die Anfrageschritte
    - Erhaltung einer länger gültigen Verbindung für SSO-Zwecke
  - ggf. weitere Cookies je nach Login-Handler

##### Antwort des IdP an SP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- IdP verwendet Namen des *Principals*, SP, Protokoll und Binding/Profile zur Bestimmung, welche Information zum SP zurückzuschicken ist und Art des Packaging
- IdP sammelt zunächst Attribute für Nutzenden über [Attribut-Resolver](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726159/AttributeResolverConfiguration)
- Sammeln von Nutzerdaten von allen Backend-Quellen (ggf. Umwandlung), Anhängen von Encodern an jedes Attribut
- Weiterleitung der Attribute durch [Attribut-Filter](https://shibboleth.atlassian.net/wiki/spaces/IDP30/pages/2494726157/AttributeFilterConfiguration)
  - ggf. Reduzierung der tatsächlich in Antwort verwendeten Attribute
- Attribute meist abhängig von SP und *Principal* zum Datenschutz
- resultierende Informations ggf. nur "jemand hat sich erfolgreich authentifiziert"
- Packen der Nutzerdaten in geeignete Form für Antwort
  - Verwendung des vorher angehängten Encoders, meist in einer SAML Assertion
  - ggf. Signieren der Assertion mit Schlüssel des IdPs
  - ggf. Verschlüsselung mittels Schlüssel des SPs $\Rightarrow$ Sicherheit & Privatsphäre
- Platzieren der Assertion (Referenz darauf auch *Artefact*) in Antwort
  - Weiterleitung durch Browser des Clients zurück an SP zum Endpunkt ([*Assertion Customer Service*](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/958759025/AssertionConsumerService))

##### Zurück zum SP

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- Browser liefert Antwort vom IdP an Endpunkt eines Assertion Consumer Services (ACS) im SP
- ACS Implementierung
  - Dekodierung der Nachricht
  - ggf. Entschlüsselung der Assertion
  - Durchführung von Security Checks
- SP
  - Extraktion der Attribute und anderer Informationen aus Nachricht
  - Erstellung einer neuen User-Session
  - Übersetzung der Attribute in cache-bare Form mittels [*Attribute Extractor*](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334409/AttributeExtractor) vom SP
  - Weiterleitung durch [*Attribute Filter*](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334516/AttributeFilter)
  - Caching in neuer Session mit anderen relevanten Infos
- nach Erstellung der Session: Bestimmung der Zieladresse für Browser über *Relay State Information* vom IdP
- Cookie, der vom SP gelesen wird
  - "The 'relay state' information returned by the IdP, if any, will have been created by the SP and if using a cookie, will point to a specially named cookie that should accompany the authentication response supplied to the ACS endpoint in this step. This is the cookie set in Step 2 above. If this cookie is missing (or if no relay state exists at all), the associated application's homeURL property is substituted as a fall back."
- Ressource-Location final bestimmt $\Rightarrow$ Weiterleitung des Browsers dorthin durch SP
- Cookie, welcher vom SP gesetzt wurde
  - "The SP will associate the browser with the newly created session by sending a cookie containing a session key to the client as part of the redirection to the resource."

##### Zurück zur geschützten Ressource

[@shibbolethFlowsAndConfigShibbolethConcepts2019]

- finaler Schritt
- Weiterleitung des Browsers zur geschützten Ressource, auf welche in Schritt 1 zugegriffen wurde
- dieses Mal Zugriff im Kontext einer Session, welche im [Session Cache](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065334650/SessionCache) vom SP gespeichert wurde
- Cookie, welche vom SP gelesen wurde
  - "The cookie containing the session key set in the previous step is expected to accompany all subsequent requests for protected resources. This is why it's essential that the ACS endpoint and resource location share a virtual host; if they do not, the session cookie set in the previous step won't be returned by the browser, and looping typically results."
- Annahme: Session wurde anerkannt und validiert vom SP
  - alle anwendbare [Access Control](https://shibboleth.atlassian.net/wiki/spaces/SP3/pages/2065335430/AccessControl) Plugins werden durchgesetzt
  - Annahme: Zugriff gewährt
    - Anfrage wird durchgeführt mit allen gecached Attributen, welche an Anfrage hängen

#### Metadaten

[@shibbolethMetadataConcepts]

- Bereitstellung der Configuationsdaten in der Kommunikaton zwischen SP und IdP
- Typischerweise in XML
- Basiert auf der SAML 2.0 Metadata specification standardized by OASIS
- Wah. zu spezifisch für eine allgemeine Erklärung von Shibboleth

#### Sessions

[@shibbolethSessionsConcepts]

- Der Prozess beinhaltet mehrere Sessions, zwischen user und service
- In den meisten Fällen durch cookies realisiert
- Zur Realisierung von Single Sign-On und damit einhergehender vermeidung weiterer Authentisierungen
- Jede Anwendung sollte eine eigene Session über den Browser haben
- Sessions sind eigenständig und der Ablauf ist unabhäning von den anderen
- Sonderfall: Single-log-out kann ein Problem sein, wenn Sessions miteinander verbunden werden

#### Name Identifiers

[@shibbolethShibbolethConceptsNameIdentifiers2020]

- In SAML2 dargestellt durch `<NameID>`-Element
    - nicht festgelegt was als *name identifier* verwendet wird
    - erschwert Interoperabilität
- Verwendet für spätere Kommunikation (Query, Logout Request)
- "transient" identifiers sind üblich in Shibboleth
- name identifier verbunden mit einem Format (für die Verarbeitung während der Laufzeit)
- Attributes können mehrere Werte besitzen -> nicht als identifiers nutzbar
- Shibboleth nutzt häufig Attributes mit *transient identifiers* (oder gar keinen)
  - meistens nicht bei kommerzieller Verwendung (verwendet name identifiers locker/unsachgemäß)


#### OpenSAML

[@shibbolethOpenSAML]

- "OpenSAML is a set of open source Java libraries used in support of the Shibboleth Project's implementation of the Security Assertion Markup Language (SAML). It is licensed under the Apache 2.0 license."
- OpenSAML ist keine vollumfängliche Implementierung von SAML IDP oder SP

#### Active-Directory vs Shibboleth

[@overtsoftwareAzureADADFS2022]

- Beides Identity Provider
- ADFS (Active Directory Federation Services) eher für größere Unternehmen
- Shibboleth vor allem im höheren Bildungskontext vertreten
- Shibboleth Windows-unabhänig und decentralized open-source software
- ADFS hat im vergleich zu Shibboleth weniger Schnittstellen implementiert wie LDAP oder SAML

##### Azure AD vs AD
[@sommergutWasSindUnterschiede2019]

- Azure Active Directory ist Identitätsmanagement der Microsoft-Cloud
- Active Directory ist das On-Promise Modell 

[@chikMicrosoftEntraExpands2023] [@celestedgNewNameAzure2024]

- Microsoft Azure Active Directory wurde zu Microsoft Entra ID umbenannt um verwirrung zu vermeiden

#### Weiteres

- TODO: [Glossar](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645488/Glossary)
    - hier auch hilfreiche Definition gegeben, falls noch fehlend
- ggf. [weitere Konzepte](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/overview#More-Concepts)

#### Identity Provider Discovery [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- Identifikation von Heim-IdP für Login bei Zugriff auf geschützte Ressource --> *IdP Discover*
- viele verschiedene Wege
- meistens Nutzenden direkt fragen, da diese:r am besten antworten kann
- Möglichkeiten
  - flache, statische Seite mit festen, bekannten möglichen IdPs (*Flat Page Discovery*)
  - dynamischer **Discovery Service**
    - separate Anwendung zur Generierung der verschiedenen Optionen basierend auf Metadaten
- Anzeige der Optionen und Weiterleitung zu entsprechendem Heim

<br>

##### Flat Page Discovery [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- meist ausreichend bei eingeschränkter, statischer Menge an IdPs
- Verwendung von *SessionInitiator* vom SP

###### von bekanntem Heim [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- Nutzende kommen direkt von Quelle, die Home-IdP per Definition kennt
- Quelle kann Nutzende direkt zur Ressource schicken
  - bereits authentifiziert für jeweiligen SP
  - oder bereits ausgewählten IdP für Nutzenden
- bspw. Campus-Portale, auf Bibliotheksseiten oder spezifische URL-Pfade für eine:n Kund:in

zwei Möglichkeiten für Redirect

- am besten Verwendung eines bekannten Session Initiators beim SP
  - kodierte Entity-ID für IdP an URL anhängen
  - Beispiel auf [Website](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263)
  - Untersuchung der Metadaten durch SP --> Validierung (bekannt?) und Weiterleitung zu richtigen Endpoints bei IdP und SP
  - automatisches und direktes Absenden der AuthnRequest zu IdP
  - Nutzende landen nach Authentifizierung direkt bei Ressource
  - kann in jegliche Links platziert werden
  - optionale Angabe eines separaten `target`s zur Spezifizierung der Landing Page
- in Anwendung / Application
  - bei sehr kleiner, bekannter Menge an IdPs
  - bspw. über Einbettung der verschiedenen Logos für jeden Provider mit Links zu jeweiligem Session Initiator
  - ähnlich zu anderer Möglichkeit, aber Verwendung eines speziellen Session Initiators für jeden IdP
  - verpflichtende Spezifizierung eines `target`s
  - Beispiel auf [Website](https://shibboleth.atlassian.net/wiki/spaces/CONCEPT/pages/928645263)

##### Discovery Service [@shibbolethIdPDiscoveryShibbolethConcepts2020]

- *IdP Discovery Service* (DS)
- Service zur Präsentation eines Standard-Interfaces zur Auswahl des IdPs
- hoch-anpassbare Darstellungsmöglichkeiten
- nach Auswahl durch Nutzenden: Weiterleitung zu SP des Nutzenden
- SP sendet AuthnRequest basierend auf Auswahl
- meist direkte Weiterleitung zu DS
  - moderne Implementierungen erlauben Einbettung des Discovery-Interfaces in Seite
    - [Embedded DS](#embedded-discovery-service)
- Betreibung mit Ressource oder als zentraler, geteilter Service

**Betreibung mit Ressource**

- Präsentation der kleinstmöglichen Anzahl an Auswahlmöglichkeiten
- Ressource kennt alle IdPs, die es akzeptiert und kennt mit welchen *Federation*s es kooperiert
- v.a. bei Services mit mehreren Communities oder Teilmengen davon hilfreich
- ggf. schlaues Vorschlagen von wahrscheinlicheren IdPs basierend auf Metadaten (bspw. IP-Adresse)
- ggf. Branding der Ressource entsprechend DS
- Nachteil: jede Ressource muss eigenen DS verwalten, ggf. Inkonsistenzen in UX
- [weitere Infos zum Einreichten](https://shibboleth.atlassian.net/wiki/spaces/SHIB2/pages/2577072297/DiscoveryService)

**zentraler Ansatz**

- Umfragen: Konsistenz als wichtigstes Feature
- Garantieren durch zentralen DS
- erlaubt Persistenz über mehrere Anwendungen, die sich DS teilen
  - Nutzende müssen erheblich weniger ihr Home-IdP auswählen
- meist im Verbund betrieben \[bspw. DFN\]
  - ggf. Probleme für Anwendungen, die mehrere Verbünde unterstützen
  - ähnliche UX wie DS, welche mit Ressource betrieben werden, mittels [SeamlessAccess](https://seamlessaccess.org/)

#### IdP Installation [@shibbolethInstallationIdentityProvider2024]

- Prüfung der [System Requirements](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199511079)
- Requirements
  - TLS Key / Certificate für HTTP(S)
  - gewünschte Entity-ID-URL für IdP
  - 2nd/3d-level-DNS-Subdomain für *Scoped Attributes* (meist E-Mail-Domain der Organisation)
  - Quellen der SAML Metadaten für SPs, welche von IdP unterstützt werden sollen
- Prozess erstellt
  - überschreibbaren IdP's Entity-ID
  - separates, selbst-signiertes Key/Certificate-Paar für
    - Message Signing und
    - Verschlüsselung der Daten anderer Systeme zum Entschlüsseln durch IdP
  - Secret Key and Key Version File zum Sichern der cookies und anderer produzierter Daten
  - initiale Beispiel-Metadaten zur Beschreibung des IdPs
    - Verwendung durch kooperierende SPs
  - Standard-IdP-Konfigurationsdateien basierend auf o.g. Informationen
- Installation auf Windows separat (hier nur nicht-Windows)

<br>

- IdP ist Standard-Java-Web-Anwendung basierend auf Jakarta Servlet 5.0 Spezifikation
- sollte in kompatiblen Servlet-Container (Jetty (empfohlen) oder Tomcat) laufen
- Schritte
  - Vorbereitung eines Servlet Containers (Empfehlung: Jetty)
  - Herunterladen und Entpacken des IdP Softwarepakets
  - `bin/install.sh` ausführen
    - ggf. Property File für [*Property Driven Installation*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199500711/PropertyDrivenInstallation) angeben
    - verschiedene CLI-Argumente
  - Deployment der IdP-WAR-Datei `war/idp.war` (siehe Servlet Container Preparation Notes)
- Testen mittels `bin/status.sh`

<br>

typische nächste Schritte

- [Konfigurationsseite](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199501666/Configuration) anschauen
- Konfiguration der [Authentifizierung](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199505085)
  - TODO: ggf. näher anschauen
- Konfiguration der [*Attribute Resolution*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199502864/AttributeResolverConfiguration)
- [Hello World](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199510241) ausprobieren zum test der Konfigurationen
- Laden der SAML-Metadaten für SPs
- Herstellen einer [*Attribute Release Policy*](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199501794)
- Anpassung der [Login UI](https://shibboleth.atlassian.net/wiki/spaces/IDP5/pages/3199505587), Fehlerbehandlung etc.

#### Service Provider V3

[@shibbolethServiceProviderApplication2021]

- Service Provider (SP) - System welches Authentifizierung von IdP entgegen nimmt
- Keine Relation zwischen installierten(/physichen) SP und *logical* SP
  - ein SP kann mehrere Web Servers beinhalten
  - mit einer Installation können mehrere verschiedene SP bereitgestellt werden
- *entityID* bezeichnet SP - normalerweise eine URL
- Ein SP ist zuständig für einen *logical service* - IdP kann Ressourcen nur an unterschiedlichen SP unterscheiden


##### Applications

- SP kümmert sich um die Gruppierung von Ressourcen
- Eine Gruppierung ist eine *Application* 
  - eine *user session* ist mit einer Application verbunden
  - zugriff auf andere Application -> unabhängige Verständigung mit IdP, andere *assertions*, unabhängige Attribute gecached
    - könnte zu einem seperaten Login führen 
  - normalerweise verbunden mit einem *logical* SP -> flexibler mit SP V3
  - verwendet eine *handlerURL* 
    - Prefix von Anfragen an SP *handlers* bspw. *Assertion Consumer Services* und *Session Initiators*
- Keine technische Notwendigkeit zwei Ressourcen einer Application im selben Ordner oder sogar selben virtuel host zu haben

##### Content Protection

[@shibbolethServiceProviderProtectContent2021]

###### Active

- Abfangen von Anfragen an die Ressource um die Session auf eine valide Authentifizierung zu überprüfen
- Anhängen von `requireSession` an die Ressource
- Statische Zugangsbeschränkungen mit den Session-Informationen möglich

###### Passive

- Nutzen von *CGI* Variablen um Informationen über authetifizierte Sessions bereitzustellen
- Unauthentifizierte Anfragen werden unverändert gelassen
- Sinnvoll bei "Gast"-Nutzung und bei Verwendung verschiedener Authentifizierungmethoden

#### Embedded Discovery Service

[@shibbolethEmbeddedDiscoveryService2021]

- Eigener discovery service beim SP durch Embedded Discovery Service (EDS) möglich
- Kein redirect zu einer third-party discovery service Seite

[@shibbolethEmbeddedDiscoveryService2011]

- Wird verwendet während des Single Sign-On (SSO)
- Nutzer wählt IdP aus -> startet SSO
- Lösungen neben EDS
  - URI manuell eingeben
  - manche IdPs "hard-coden"
  - zentralisierte discovery, hat Probleme:
    - kann IdPs vorschlagen, die nicht mit dem SP zusammenhängen
    - anderes Aussehen und Handhabung
    - keine Möglichkeit IdPs bevorzugt darstellen
- EDS bietet
  - nahtloser Übergang von SP -> EDS -> IdP
  - Einschränkung der angezeigten IdPs
  - Ordnung der IdPs konfigurieren

### Shibboleth Consortium Mitgliedschaften

[@shibbolethShibbolethConsortium2024]

- Finanzierung durch Mitgliedschaften
- erlaubt Unterstützung und Pflege des Systems
- verringertes Risiko für Organisationen, die Shibboleth verwenden
- u.a. Stanford University, University of Oxford, DFN Verein,
  Massachusetts Institute of Technology [@shibbolethOurMembers2024] (Auswahl)

<br>

[@shibbolethMembership]

- Mitgliedschaft bringt exclusiven Support wie Slack-Channel
- Unterstüzt die Weiterentwicklung
- Partizipation durch Einbringen von eigenen Ideen und Vorschlägen für die Weiterentwicklung

[@shibbolethConsortiumMembershipFees]

- Als Consortium Mitglied bezahlt man basierend auf der Art und Größe der Institution einen jährlichen Geldbetrag (Fee)

### Einsatz

#### DFN

[@dfnDFNAAIDokumentationEinfuhrung]

- DFN-AAI = Deutsches Forschungsnetz Authentication and Authorization Infrastructure
- IdPs sind die Heimatorganisationen (Bildungs- und Forschungseinrichtungen)
- SP sind der teilnehmenden Dienstanbieter (Content-Provider, E-Learning-Plattformen, wissenschaftliche Dienste, etc.)
- IdPs und SPs sind beim im DFN-AAI registriert
- Attribute Authorities sind zusätzliche Instanzen
  - projektspezifische Nutzerdaten hinterlegt, die nicht beim IdP gespeichert sind
- Nutzung von SAML zur Kommunikation der Entities (IdP, SP, Attribute Authorities) untereinander
- IdPs verpflichten sich die Metadaten aktuell zu halten damit SPs sich auf Berechtigung verlassen können

#### Switch AAI

[@switchIntroductionSWITCHaai2024]

- AAI: *Authentication and Authorisation Infrastructure*
- Ziel: Vereinfachung von inter-organisationellem Zugriff auf Web-Ressourcen
- von den meisten Universitäten in der Schweiz eingesetzt
- Konzept: *Federated Identity Management*
- Vorteile
  - einfache Anmeldung ohne Registrierung bei verschiedenen Services
  - standardisierte Interfaces $\to$ einfache Integration weiterer Organisationen
  - standardisierte Authentifikationsmechanismen $\to$ nur ein Passwort für viele Anwendungen

![SWITCHaai: At a Glance [@switchIntroductionSWITCHaai2024]](https://help.switch.ch/aai/about/aai-at-a-glance.png)

[@switchSWITCHaai2024]

- ohne AAI: Registrierung bei jeder Ressource
  - jeweils Nutzername und Passwort
  - Administrator: Verwaltung und Implementierung
- mit AAI: vereinfacht
  - eine Registrierung bei Home-Organisation genügt, bspw. Institutionen wie Universitäten, Bibliotheken etc.
  - Authentifikation über Home-Organisation
    - kann weitere Informationen bereitstellen
    - Credentials nur einmal notwendig
    - keine neue Registrierung und Verwaltung von Nutzenden notwendig
  - Ressourcen-Administratoren definieren Access Rules basierend auf erhaltenen Nutzerinformationen
- *SWITCH*
  - verwaltet zentrale AAI-Komponenten
  - unterstützt Home-Organisations und Ressourcen

##### Einfache Demo [@switchSimpleDemoSwitchAAI2024]

- zunächst nur Nutzersicht

![Shibboleth Login Procedure [@switchSimpleDemoSwitchAAI2024]](https://help.switch.ch/aai/demo/resources/simple_complete.png)

- Zugriff von Nutzer von "Uni B" auf geschützte Ressource "Medical Training 1",
  gehostet auf `www.resource.ex`
- Schritt 1: Verbindung Nutzer - Ressource und Weiterleitung
  - Zugriff auf geschützte Ressource auf `www.resource.ex`
  - aktive Shibboleth-Session $\to$ direkte Weiterleitung zur Ressource
  - sonst Authentifizierung bei *Home Organisation* (Uni B)
  - Ressource hat keine Information über Home Org. des Nutzers $\to$ Weiterleitung
    zum *Discovery Service* (*Where Are You From service*, WAYF) (`www.wayf.ex`)
- Schritt 2: Wahl der Home Org.
  - Discovery Service $\to$ Liste von Home Organisationen
  - Auswahl durch Nutzenden (hier Uni B) 
  - Weiterleitung zur Ressource inkl. Authentifizierungsanfrage über Browser
  - somit Weiterleitung zur Login-Seite der Home Org. `www.uni-b.ex`
  - ggf. Überspringen der Auswahl der Home Org. wenn noch gespeichert
- Schritt 3: Authentifizierung des Nutzenden bei Home Org.
  - Login-Seite von Uni B
  - normale Zugangsdaten von Home Org. (meist Nutzername und Passwort)
  - korrekte Eingabe $\to$ Weiterleitung zu ursprünglich angeforderter Ressource
    auf `www.resource.ex`
- Schritt 4: Zugriff auf Ressource gewährt
  - nach erfolgreicher Authentifizierung bei Home Org.
  - Ressource entscheidet, ob Zugriff gewährt wird (*Autorisierung*)
  - basierend auf von Home Org. übermittelte Nutzerinformationen
  - Home Org. gibt nur zwingen notwendige Informationen Preis $\to$ Garantie des 
    Datenschutzes
- kein zusätzlicher Account notwendig sondern Authentifizierung mittels Home Org.
- keine Preisgabe des Nutzernamens
- Ende der Session
  - nach Authentifizierung mittels Shibboleth: Zugriff auf alle 
    Shibboleth-geschützten Ressourcen ohne erneute Authentifizierung
  - erst nach Schließen des Browsers oder bestimmter Zeit erneut notwendig

##### Medium Demo [@switchMediumDemoSwitchAAI2024]

- selbiges Szenario wie in Einfache Demo
- Live Demo (ggf. für **Präsentation**?)
  - Ressource: `https://aai-demo.switch.ch/secure/`
  - Discovery Service: `https://wayf-test.switch.ch`
  - Home Org. Login: `https://aai-demo-idp.switch.ch`
- Schutz via SSL

![Vollständiger Login-Prozess vom Shibboleth [@switchMediumDemoSwitchAAI2024] (Schritt-für-Schritt-Bilder vorhanden)](https://help.switch.ch/aai/demo/resources/medium_complete.png)

Phase 1: Verbindung Nutzer - Ressource und Weiterleitung

- direkte Weiterleitung bei aktiver Shibboleth-Session
- *oder* Weiterleitung zu Discovery Service (WAYF)
- Schritt 1
  - HTTP-Request an `aai-demo.switch.ch` für Webseite `/secure/`
  - Antwort vom Web-Server: HTTP-Redirect an Discovery Service `wayf-test.swtch.ch`, 
    da keine valide Shibboleth-Session vorhanden (noch keine Authentifizierung)
- Schritt 2: Discovery Service sendet HTML Webseite mit Liste aller verfügbaren Home Org.

Phase 2: Authentifizierungsanfrage

- Live Demo: Auswahl von "AI Demo Home Organisation"
- Schritt 3
  - Absenden des Formulars zur Wahl der Home Org.
  - Antwort vom Discovery Service: Weiterleitung zum *Session Initiator* der Ressource
- Schritt 4
  - Erstellung einer Authentifizierungsanfrage für gewählte Home Org. durch
    Session Initiator
  - Abschicken durch Nutzer-Browser zur Home Org.
- Schritt 5
  - Verwertung der Anfrage durch Home Org.
  - Antwort: Login-Seite

Phase 3: Authentifizierung des Nutzenden bei Home Org.

- Live Demo: uname `demouser` / pw `demo`
- je nach Home Org. unterschiedlich
- Credentials: Nutzername & Passwort, Biometrie, Chip-Karte etc.
- Schritt 6
  - Nutzende stellen Credentials zur Verfügung
  - Prüfung der Credentials
  - Erstellung einer *Assertion* mit Nutzerattributen (verschlüsselt) entsprechend
    den Attributfilter
- Schritt 7
  - Abschicken der Assertion via Browser zurück zur Ressource
  - Autorisierung basierend auf Attributen durch Ressource
  - erfolgreich: Weiterleitung zu geschützter Ressource

##### Experten Demo [@switchExpertDemoSWITCHaai2024a]

- inkl. Hintergrundprozesse und interagierende Komponenten
- hier dekodiertes URL-Format

![Gesamter Login-Prozess [@switchExpertDemoSWITCHaai2024a] (Schritt-für-Schritt-Bilder vorhanden)](https://help.switch.ch/aai/demo/resources/expert_complete.png)


Phase 1: erster Zugriff auf Service Provider und IdP Discovery

- Schritt 1: User $\Leftrightarrow$ Browser $\Leftrightarrow$ Service Provider
  - Zugriff auf Service Provider unter `https://aai-demo.switch.ch/secure`
    ```
    GET https://aai-demo.switch.ch/secure
    ```
  - vom Shibboleth SP geschützt $\to$ Überprüfung, ob bereits Shibboleth-Session 
    aktiv (d.h. bereits authentifiziert)
  - nicht auth. $\to$ HTTP Redirect zum Discovery Service `wayf-test.switch.ch`
  - braucht Informationen, wohin Nutzender schließlich geschickt werden muss
    $\to$ Bereitstellung als `GET`-Parameter
    ```
    302 FOUND (REDIRECT)
      Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=https://aai-demo.switch.ch/secure
        path=/

      Location: https://wayf-test.switch.ch/SWITCHaai/WAYF
      ?entityID=https://aai-demo.switch.ch/shibboleth
      &return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem
    ```
- Schritt 2: Browser $\Leftrightarrow$ Discovery Service
  - Abschicken einer neuen Anfrage an Discovery Service
    ```
    GET https://wayf-test.switch.ch/SWITCHaai/WAYF
      ?entityID=https://aai-demo.switch.ch/shibboleth
      &return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem
    ```
  - Antwort mit Website zur Auswahl des IdP
    ```
    200 OK
      [WAYF DROPDOWN HTML PAGE] 
    ```
- Schritt 3: Nutzer $\Leftrightarrow$ Browser $\Leftrightarrow$ Discovery Service
  - Discovery Service Seite: Nutzer schickt IdP-Auswahl ab
    ```
    POST https://wayf-test.switch.ch/aaitest/WAYF?entityID=https://aai-demo.switch.ch/shibboleth&return=https://aai-demo.switch.ch/Shibboleth.sso/Login?SAMLDS=1&target=ss:mem

    POSTDATA
      user_idp=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```
  - Discovery Service sendet Redirect zur *Return-Destination* inkl. ausgewähltem IdP
    ```
    302 FOUND (REDIRECT)
    Location: https://aai-demo.switch.ch/Shibboleth.sso/Login
      ?SAMLDS=1
      &target=ss:mem
      &entityID=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```

Phase 2: Session Initialisierung und Authentifizierungsanfrage

- Schritt 4: Browser $\Leftrightarrow$ Service Provider
  - Browser sendet folgende Request aufgrund von vorheriger Redirect-Response
    ```
    GET https://aai-demo.switch.ch/Shibboleth.sso/Login
      ?SAMLDS=1
      &target=ss:mem
      &entityID=https://aai-demo-idp.switch.ch/idp/shibboleth
    ```
  - Session Initiator erstellt Authentifizierungsanfrage
  - Absenden innerhalb einer *Auto-Submit-Post-Form*
    ```
    200 OK
      [AUTHN REQUEST POST FORM HTML PAGE]
    ```
- Schritt 5: Browser $\Leftrightarrow$ IdP
  - Browser postet Request automatisch mittels JS
    ```
    POST https://aai-demo-idp.switch.ch/idp/profile/SAML2/POST/SSO
    POSTDATA
      RelayState=ss:mem:23e3a3b1268acd89dc226bb1ce0d0c6ba7ecf773
      SAMLRequest=PHNhbWxwOkF1dGhuUmVxdWVzdCB4bWxuczp...
    ```
  - Prüfen der Authentifizierungsanfrage vom IdP (Nutzer noch nicht auth.)
  - Senden eines Redirects zum entsprechenden Login-Handler
    - hier: Nutzername, Passwort
    ```
    302 MOVED TEMPORARILY (REDIRECT)
      Set-Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
        Path=/idp
        Secure

      Location: https://aai-demo-idp.switch.ch:443/idp/AuthnEngine
    ```
- Schritt 6: Browser $\Leftrightarrow$ IdP
  - Weiterleitung des Webbrowsers zum Nutzername / Passwort Login-Handlers
    ```
    GET https://aai-demo-idp.switch.ch/idp/AuthnEngine
      Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
    ```
  - Weiterleitung zu spezifischer Anmeldeseite durch IdP
    ```
    302 MOVED TEMPORARILY (REDIRECT)
      Location: https://aai-demo-idp.switch.ch:443/idp/Authn/UserPassword
    ```
- Schritt 7: Browser $\Leftrightarrow$ IdP
  - Senden einer `GET`-Request für Login-Seite durch Browser
    ```
    GET https://aai-demo-idp.switch.ch/idp/Authn/UserPassword    
      Cookie: _idp_authn_lc_key
        value=C22C16A197CB9606067A1A577EF5D996
    ```
  - Antwort vom Webserver mit Nutzername/Passwort-Seite
    ```
    200 OK
      [USERNAME PASSWORD LOGIN FORM HTML PAGE]
    ```

Phase 3: Authentifizierung, Attribut-Statement und Zugriff

- Schritt 8: Nutzer $\Leftrightarrow$ Browser $\Leftrightarrow$ IdP
  - Eingabe der Credentials durch Nutzenden
  - Abschicken an IdP
  ```
  POST https://aai-demo-idp.switch.ch/idp/Authn/UserPassword
    POSTDATA
      j_username=demouser
      j_password=demo

    Cookie: _idp_authn_lc_key
      value=C22C16A197CB9606067A1A577EF5D996
  ```
  - Verifikation der Credentials durch Authentifizierungs-Engine des IdPs
  - erfolgreich $\to$ Attribute-Resolving und -Filtering durch *Attribute Authority*
  - Generierung einer HTML-Seite inkl. *SAML Assertion*
    - beinhaltet Auth.-Statement und Attribute Statement mit Nutzerattributen
    - daher "Attribut Push"
  - Übertragung der Assertion mittels *Auto-Submit-Post-Form*
  ```
  200 OK
  Set-Cookie: _idp_session
    value=4m2ETlKYtvbNEmBzVNo3UHLuKSdo3HqTUqAmeZiar94=
    Path=/idp
    
  [ASSERTION POST FORM HTML PAGE] 
  ```
- Schritt 9: Browser $\Leftrightarrow$ Service Provider
  - direkt im Anschluss: Absenden der folgenden Anfrage durch Browser
    ```
    POST https://aai-demo.switch.ch/Shibboleth.sso/SAML2/POST
      POSTDATA
        RelayState=cookie
        SAMLResponse=PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGl...

      Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=https%3A%2F%2Faai-demo.switch.ch%2Fsecure
    ```
  - Verarbeitung der SAML Assertion inkl. Authentifizierungs- und 
    Attribut-Statements durch SP
  - SP: Absenden eines Redirects zur angefragten Ressource
    - Lagerung der URL in `_shibstate` Cookie
    ```
    302 FOUND (REDIRECT)
      Set-Cookie: _shibstate_64656661756c7468747470733a2f2...
        value=
        path=/

      Set-Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0
        path=/

      Location: https://aai-demo.switch.ch/secure
    ```
- Schritt 10: Browser $\Leftrightarrow$ Service Provider
  - vgl. Schritt 1: erneute Anfrage der geschützten Ressource
    (`https://aai-demo.switch.ch/secure`)
    ```
    GET https://aai-demo.switch.ch/secure
      Cookie: _shibsession_64656661756c7468747470733a2f2...
        value=_0b6d4e89d2e9c4481738094f2a2c9de0
    ```
  - Nutzer bereits authentifiziert
  - Entscheidung über notwendige Rechte durch Apache Web-Server
    - eingebettetes `mod_shib`-Modul: Untersuchung der Shibboleth-Access-Rules
    - Matching mit Nutzer-Attributen
    - Access-Rule in Demo:
      ```
      # content of secure/.htaccess
      AuthType shibboleth
      ShibRequireSession On
      require valid-user 
      ```
  - SP gibt Inhalt der Seite zurück
    ```
    200 OK
      [RESOURCE HTML PAGE]
    ````
- folgende Zugriffe an SP werden direkt gewährt (Timeout)

### TODO: Alternativen zu Shibboleth

- https://www.techrepublic.com/article/best-open-source-iam-tools/
- https://alternativeto.net/software/shibboleth/
- https://gist.github.com/bmaupin/6878fae9abcb63ef43f8ac9b9de8fafd
- https://goauthentik.io/
