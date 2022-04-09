Задача 3
Есть продукты A, B, C, D, E, F, G, H, I, J, K, L, M. Каждый продукт стоит определенную сумму.
Есть набор правил расчета итоговой суммы:
1. Если одновременно выбраны А и B, то их суммарная стоимость уменьшается на 10% (для каждой пары А и B)
2. Если одновременно выбраны D и E, то их суммарная стоимость уменьшается на 5% (для каждой пары D и E)
3. Если одновременно выбраны E,F,G, то их суммарная стоимость уменьшается на 5% (для каждой тройки E,F,G)
4. Если одновременно выбраны А и один из [K,L,M], то стоимость выбранного продукта уменьшается на 5%
5. Если пользователь выбрал одновременно 3 продукта, он получает скидку 5% от суммы заказа
6. Если пользователь выбрал одновременно 4 продукта, он получает скидку 10% от суммы заказа
7. Если пользователь выбрал одновременно 5 продуктов, он получает скидку 20% от суммы заказа
8. Описанные скидки 5,6,7 не суммируются, применяется только одна из них
9. Продукты A и C не участвуют в скидках 5,6,7
10. Каждый товар может участвовать только в одной скидке. Скидки применяются последовательно в порядке описанном выше.

Необходимо написать программу с использованием ООП (или структур/интерфейсов, если ООП не поддерживается языком) которая
имея на входе набор продуктов (один продукт может встречаться несколько раз) рассчитывала суммарную их стоимость.
Программу необходимо написать максимально просто и максимально гибко.
Все параметры задаются в программе статически (пользовательский ввод обрабатывать не нужно). Оценивается подход к 
решению задачи. Тщательное тестирование решения проводить не требуется. 

Пожелания к решению:
Чтобы в коде были учтены принципы SOLID (особенно инверсия зависимостей)
Взаимоотношения (контракты) между объектами должны быть прозрачны
Низкая связанность, высокая связность
Желательно предпочтение динамически зависимостям над статическими
Выделение архитектурных слоев - бизнес-логика, инфраструктурный, операционный (см. Domain driven design)
Тесты - где видите нужным, основные тест-кейсы и крайние значения
