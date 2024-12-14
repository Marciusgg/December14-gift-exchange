--The Gift Exchange 🎁
--Today you’re working with a database of gift exchange events. Your goal is to find the amount of participants who got the gifts they had wished for.

SELECT -- Skaičiuojame (COUNT) dalyvių ID iš 'gift_exchanges' lentelės, naudodami (DISTINCT) skaičiuojame tik unikalius pasikartojimus, nes salyga kiek dalyvių gavo norimas dovanas, o ne kiek norimų dovanų buvo gauta
  COUNT(DISTINCT ge.receiver_id) AS wished_gifts_received
FROM -- Pasirenkame, kad skaičiuojama iš 'gift_exchanges' lentelės ir pavadiname ge, dėl patogumo. "Išsiaiškinta, jog 'AS' nebūtinas, bet pasirašau dėl supratimo"
  gift_exchanges AS ge
JOIN -- Sujungime lenteles 'gift_exchanges' su 'user_wishlists' naudojant (JOIN)
  user_wishlists AS uw
ON -- Nustatome, kurie stulpeliai nurodo dalyvio, kuris gauna dovanas ID
  ge.receiver_id = uw.user_id
AND -- Sutapatindami 'gift_name' stulpelius nustatoma, kurios dovanos iš 'user_wishlists' lentelės sutampa su gautomis iš 'gift_exchanges'
  ge.gift_name = uw.gift_name;