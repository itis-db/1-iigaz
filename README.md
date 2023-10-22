[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/NkHLBUoI)
# activity

ДАНО: Структура activity, которая отражает иерархию (от верхнего уровня к нижнему):

• Программы (Program) • Подпрограммы (Sub Program) • Проекты (Project) • Контракты (Contract) • Контрольные точки (Point). КТ могут относиться как к контрактам, так и к проектам.

Все дерево иерархии хранится в таблице Activity (основные его атрибуты). Дополнительные атрибуты каждой сущности хранятся в таблицах Program, Sub Program, Project, Contract, Point. Привязка таблиц с доп. атрибутами к таблице Activity осуществляется по первичным ключам (один к одному). Привязка сущностей друг к другу осуществляется через поле Activity.ParentId. Кроме того, у контрактов есть привязка к территории (Area) через поле Contract.AreaId. В таблице Activity есть атрибут ActivityTypeId – ссылка на справочник типов сущностей ActivityType.

Нужно решить на языке SQL или PLPGSQL 1 задание, выбор сложности за вами

Задание lvl 1: Получить иерархический список описанных сущностей: Программа -> Подпрограмма -> Проект -> Контракт

Задание lvl 2: Получить иерархический список описанных сущностей с включением территории (Area) на 3-й уровень иерархии. В итоге, полная иерархия следующая: Программа -> Подпрограмма -> Территория -> Проект -> Контракт

Задание lvl 3: Получить иерархический список описанных сущностей с включением территории (Area) на 3-й уровень иерархии. КТ (проекта) на 5-й уровень, КТ (контракта) на 7-й уровень В итоге, полная иерархия следующая: Программа -> Подпрограмма -> Территория -> Проект -> КТ (проекта) -> Контракт -> КТ (контракта)

Дополнительно, можете ввести входной параметр: • pn_activityid int – любой ID из таблицы Activity (Activity.ActivityId) или null (по умолчанию). При указании параметра дерево должно строиться от указанной активности (включая ее саму) и вниз по иерархии.

Ожидаемый результат 3 файла sql: 

tables.sql - создание таблиц

data.sql - генерация данных 

activity.sql - решение
