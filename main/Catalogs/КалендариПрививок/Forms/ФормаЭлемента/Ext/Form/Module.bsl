﻿
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	ЭтаФорма.ТолькоПросмотр = Объект.Предопределенный;
	Элементы.СоставКалендаряКоманднаяПанель.Видимость = Не Объект.Предопределенный;
	Элементы.ДекорацияПредупреждение.Видимость = Объект.Предопределенный;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработкаКомандФормы

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура СоставКалендаряПриАктивизацииСтроки(Элемент)
	
	ТекущиеДанные = Элементы.СоставКалендаря.ТекущиеДанные;
	Если ТекущиеДанные = Неопределено Тогда
		Возврат;
	КонецЕсли;
	
	Если Не ЗначениеЗаполнено(ТекущиеДанные.Инфекция) Тогда
		Возврат;
	КонецЕсли;
	
	ПараметрыФормы = Новый Структура;
	ПараметрыФормы.Вставить("Ключ", ТекущиеДанные.Инфекция);
	
	ОткрытьФорму("Справочник.Инфекции.ФормаОбъекта", ПараметрыФормы);
	
КонецПроцедуры

&НаКлиенте
Процедура СоставКалендаряИнфекцияОбработкаВыбора(Элемент, ВыбранноеЗначение, СтандартнаяОбработка)
	
	Если ВыбранноеЗначение <> Неопределено Тогда
		ПараметрыОтбора = Новый Структура;
		ПараметрыОтбора.Вставить("Инфекция", ВыбранноеЗначение);
		Если Объект.СоставКалендаря.НайтиСтроки(ПараметрыОтбора) <> Неопределено Тогда
			СтандартнаяОбработка = Ложь;
			ТекстСообщения = НСтр("ru = 'Инфекция %1 уже присутствует в составе календаря'");
			ТекстСообщения = СтроковыеФункцииКлиентСервер.ПодставитьПараметрыВСтроку(ТекстСообщения, ВыбранноеЗначение);
			ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстСообщения);
		КонецЕсли;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура СоставКалендаряВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	
	СтандартнаяОбработка = Ложь;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыФункции

#КонецОбласти