SELECT * FROM mahalle_joined
WHERE ilce is null;

UPDATE mahalle_joined SET ilce = 'Kestel' WHERE mahalle_kodu IN (19996, 185576);
UPDATE mahalle_joined SET ilce = 'Gemlik' WHERE mahalle_kodu = 140070;
UPDATE mahalle_joined SET ilce = 'Nilüfer' WHERE mahalle_kodu IN (
  11108, 11111, 98871, 11109, 98490, 11110
);
UPDATE mahalle_joined SET ilce = 'Osmangazi' WHERE mahalle_kodu IN (
  11254, 196689, 11395
);
UPDATE mahalle_joined SET ilce = 'Gürsu' WHERE mahalle_kodu IN (11371, 11370);
