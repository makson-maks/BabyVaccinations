﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УправлениеФормой();
	
КонецПроцедуры

#КонецОбласти

#Область ОбработкаКомандФормы

&НаКлиенте
Процедура СформироватьКалендарьПрививок(Команда)
	
	Если Не ПроверитьЗаполнение() Тогда
		Возврат;
	КонецЕсли;
	
	Если Параметры.Ключ.Пустая() Или Модифицированность Тогда
		Записать();
	КонецЕсли;
	
	СформироватьКалендарьПрививокНаСервере(Объект.Ссылка);
	
	ТекстСообщения = НСтр("ru = 'Календарь сформирован'");
	ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения);
	ОбновитьПовторноИспользуемыеЗначения();
	Оповестить("ОбновитьФормуНачальнойСтраницы");
	Оповестить("СформированаНациональныйКалендарь");
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура ТипКалендаряПриИзменении(Элемент)
	
	УправлениеФормой();
	
КонецПроцедуры

&НаКлиенте
Процедура ВходитВГруппуРискаПриИзменении(Элемент)
	
	УправлениеФормой();
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыФункции

&НаСервере
Процедура УправлениеФормой()
	
	Если Объект.ВходитВГруппуРиска Тогда
		Элементы.ВходитВГруппуРиска.Заголовок = "Входит в группу риска";
		Элементы.ВходитВГруппуРиска.ЦветТекстаЗаголовка = WebЦвета.Красный;
	Иначе
		Элементы.ВходитВГруппуРиска.Заголовок = "Не относится к группе риска";
		Элементы.ВходитВГруппуРиска.ЦветТекстаЗаголовка = WebЦвета.Черный;
	КонецЕсли;
	
КонецПроцедуры

&НаСервереБезКонтекста
Процедура СформироватьКалендарьПрививокНаСервере(РебенокСсылка)
	
	РаботаСКалендаремСервер.СформироватьКалендарьПрививок(РебенокСсылка);	
	
КонецПроцедуры

#КонецОбласти